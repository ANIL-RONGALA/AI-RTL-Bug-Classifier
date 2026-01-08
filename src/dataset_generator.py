# src/dataset_generator.py
import os
import json
import random
import string

DATASET_DIR = "dataset"
OUT_JSONL = os.path.join(DATASET_DIR, "dataset.jsonl")
OUT_MANIFEST = os.path.join(DATASET_DIR, "manifest.csv")

NUM_SAMPLES = 2000
CLEAN_FRAC = 0.25

# Ban obvious label words in logs (keep it strict)
BANNED_LOG_WORDS = {
    "latch", "width", "mismatch", "driver", "default", "blocking",
    "unused", "loop", "combinational"
}

# Shared log pools (NOT class-unique)
WARN_POOL = [
    "Warning: analysis found a potential issue in this module.",
    "Warning: review recommended for this block.",
    "Warning: behavior may be unexpected under some conditions.",
    "Warning: some paths or conditions may be incomplete.",
    "Warning: check this module for robustness and completeness.",
]
ERR_POOL = [
    "Error: analysis failed due to an issue in this module.",
    "Error: cannot proceed with current design structure.",
    "Error: module contains a structural problem.",
    "Error: design contains conflicting definitions.",
    "Error: design contains a problematic dependency.",
]
INFO_POOL = [
    "Info: analysis completed with no critical issues.",
    "Info: checks completed successfully.",
    "Info: no critical findings reported.",
]

def rident(prefix="s", k=6):
    alphabet = string.ascii_lowercase + string.digits
    return f"{prefix}_" + "".join(random.choice(alphabet) for _ in range(k))

def safe_log(msg: str) -> str:
    low = msg.lower()
    if any(w in low for w in BANNED_LOG_WORDS):
        raise ValueError(f"Log leaks label word: {msg}")
    return msg

def pick_warn():
    return safe_log(random.choice(WARN_POOL))

def pick_err():
    return safe_log(random.choice(ERR_POOL))

def pick_info():
    return safe_log(random.choice(INFO_POOL))

def distractor_block(a: str, b: str) -> str:
    """Harmless correct logic using declared signals only."""
    w1 = rident("w")
    w2 = rident("w")
    ytmp = rident("t")
    return (
        f"  wire {w1};\n"
        f"  wire {w2};\n"
        f"  wire {ytmp};\n"
        f"  assign {w1} = {a} ^ {b};\n"
        f"  assign {w2} = {a} & {b};\n"
        f"  assign {ytmp} = {a} ? {w1} : {w2};\n"
    )

# ---------------- Generators ----------------

def gen_clean(tid: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    code = (
        f"module {m}(input {a}, input {b}, output {y});\n"
        f"{distractor_block(a,b)}"
        f"  assign {y} = {a} | {b};\n"
        f"endmodule\n"
    )
    log = pick_info()
    return "clean", code, log, f"clean_{tid}"

def gen_latch(tid: int):
    m = rident("m")
    en = rident("en")
    d = rident("d")
    q = rident("q")
    a = rident("a")
    b = rident("b")
    # add extra inputs to support distractor without undeclared signals
    code = (
        f"module {m}(input {en}, input {d}, input {a}, input {b}, output reg {q});\n"
        f"{distractor_block(a,b)}"
        f"  always @(*) begin\n"
    )
    if tid % 3 == 0:
        # missing else
        code += f"    if ({en}) {q} = {d};\n"
    elif tid % 3 == 1:
        # partial nested if
        code += f"    if ({en}) begin\n"
        code += f"      if ({d}) {q} = 1'b1;\n"
        code += f"    end\n"
    else:
        # no default assignment at top + partial assignment
        code += f"    if ({en}) {q} = {d};\n"
        code += f"    // other path leaves state unchanged\n"
    code += "  end\nendmodule\n"
    log = pick_warn()
    return "latch_inference", code, log, f"latch_{tid}"

def gen_width(tid: int):
    m = rident("m")
    inw = random.choice([3,4,5,8,16])
    outw = random.choice([1,2,3,4,5])
    if outw >= inw:
        outw = max(1, inw - 1)

    a = rident("a")
    b = rident("b")
    y = rident("y")

    code = (
        f"module {m}(input [{inw-1}:0] {a}, input {b}, output [{outw-1}:0] {y});\n"
        f"{distractor_block(a + f"[0]", 'b')}"

    )
    # NOTE: distractor_block expects single-bit signals. we pass a[0] and b.
    # That’s fine and declared.

    if tid % 3 == 0:
        code += f"  assign {y} = {a};\n"
    elif tid % 3 == 1:
        code += f"  assign {y} = {a}[{outw-1}:0];\n"
    else:
        pad = rident("p")
        code += f"  wire {pad};\n"
        code += f"  assign {pad} = {b};\n"
        code += f"  assign {y} = {{{pad}, {a}[{outw-2}:0]}};\n"
    code += "endmodule\n"
    log = pick_warn()
    return "width_mismatch", code, log, f"width_{tid}"

def gen_blocking(tid: int):
    m = rident("m")
    clk = rident("clk")
    d = rident("d")
    q = rident("q")
    a = rident("a")
    b = rident("b")
    code = (
        f"module {m}(input {clk}, input {d}, input {a}, input {b}, output reg {q});\n"
        f"{distractor_block(a,b)}"
        f"  always @(posedge {clk}) begin\n"
    )
    if tid % 2 == 0:
        code += f"    {q} = {d};\n"
    else:
        tmp = rident("t")
        code += f"    reg {tmp};\n"
        code += f"    {tmp} = {d};\n"
        code += f"    {q} = {tmp};\n"
    code += "  end\nendmodule\n"
    log = pick_warn()
    return "blocking_misuse", code, log, f"blocking_{tid}"

def gen_unused(tid: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    t1 = rident("t")
    t2 = rident("t")
    code = (
        f"module {m}(input {a}, input {b}, output {y});\n"
        f"{distractor_block(a,b)}"
        f"  wire {t1};\n"
        f"  wire {t2};\n"
    )
    if tid % 3 == 0:
        # declared but never used
        code += f"  assign {y} = {a} & {b};\n"
    elif tid % 3 == 1:
        # assigned but never used
        code += f"  assign {t1} = {a} | {b};\n"
        code += f"  assign {y} = {a} & {b};\n"
    else:
        # one temp used, one unused (harder)
        code += f"  assign {t1} = {a} ^ {b};\n"
        code += f"  assign {y}  = {t1};\n"
    code += "endmodule\n"
    log = pick_warn()
    return "unused_signal", code, log, f"unused_{tid}"

def gen_missing_default(tid: int):
    m = rident("m")
    sel = rident("sel")
    y = rident("y")
    a = rident("a")
    b = rident("b")
    code = (
        f"module {m}(input [1:0] {sel}, input {a}, input {b}, output reg {y});\n"
        f"{distractor_block(a,b)}"
        f"  always @(*) begin\n"
        f"    case({sel})\n"
        f"      2'b00: {y} = 1'b0;\n"
        f"      2'b01: {y} = 1'b1;\n"
    )
    if tid % 2 == 1:
        code += f"      2'b10: {y} = {a};\n"
    # never add default
    code += (
        f"    endcase\n"
        f"  end\n"
        f"endmodule\n"
    )
    log = pick_warn()
    return "missing_default", code, log, f"case_{tid}"

def gen_multi_driver(tid: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    c = rident("c")
    y = rident("y")
    t = rident("t")

    code = (
        f"module {m}(input {a}, input {b}, input {c}, output {y});\n"
        f"{distractor_block(a,b)}"
    )

    if tid % 3 == 0:
        # wire driven twice by continuous assigns
        code += (
            f"  wire {t};\n"
            f"  assign {t} = {a} & {b};\n"
            f"  assign {t} = {c};\n"
            f"  assign {y} = {t};\n"
        )
    elif tid % 3 == 1:
        # reg driven by two always blocks
        code += (
            f"  reg {t};\n"
            f"  always @(*) {t} = {a} & {b};\n"
            f"  always @(*) {t} = {c};\n"
            f"  assign {y} = {t};\n"
        )
    else:
        # reg driven by continuous + always (very strong structural conflict)
        code += (
            f"  reg {t};\n"
            f"  assign {t} = {a} & {b};\n"
            f"  always @(*) {t} = {c};\n"
            f"  assign {y} = {t};\n"
        )
    code += "endmodule\n"

    log = pick_err()  # errors share pool, not unique
    return "multi_driver", code, log, f"mdrv_{tid}"

def gen_comb_loop(tid: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    code = (
        f"module {m}(input {a}, input {b}, output {y});\n"
        f"{distractor_block(a,b)}"
    )
    if tid % 2 == 0:
        # 2-node feedback
        x = rident("x")
        code += (
            f"  wire {x};\n"
            f"  assign {x} = {y};\n"
            f"  assign {y} = {x};\n"
        )
    else:
        # longer feedback path
        x1 = rident("x")
        x2 = rident("x")
        code += (
            f"  wire {x1};\n"
            f"  wire {x2};\n"
            f"  assign {x1} = {x2};\n"
            f"  assign {x2} = {x1};\n"
            f"  assign {y} = {x1};\n"
        )
    code += "endmodule\n"
    log = pick_err()
    return "comb_loop", code, log, f"loop_{tid}"

def gen_syntax(tid: int):
    # syntax errors: keep variety; logs from shared ERROR pool
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")

    if tid % 4 == 0:
        code = f"module {m}(input {a}, {b} output {y}); assign {y} = {a} & {b}; endmodule"
    elif tid % 4 == 1:
        code = f"module {m}(input {a}, input {b}, output {y}) assign {y} = {a} | {b}; endmodule"
    elif tid % 4 == 2:
        code = f"module {m}(input {a}, input {b}, output {y}); always @(*) begin {y} = {a} & {b}; endmodule"
    else:
        code = f"module {m}(input {a}, input {b}, output {y}); assign {y} = {a} & & {b}; endmodule"

    log = pick_err()
    return "syntax_error", code, log, f"syntax_{tid}"

GENS = {
    "clean": (gen_clean, 10),
    "syntax_error": (gen_syntax, 40),
    "latch_inference": (gen_latch, 40),
    "width_mismatch": (gen_width, 40),
    "blocking_misuse": (gen_blocking, 40),
    "unused_signal": (gen_unused, 40),
    "missing_default": (gen_missing_default, 40),
    "multi_driver": (gen_multi_driver, 40),
    "comb_loop": (gen_comb_loop, 40),
}

def main():
    os.makedirs(DATASET_DIR, exist_ok=True)

    with open(OUT_MANIFEST, "w", encoding="utf-8") as mf:
        mf.write("id,label,template_id\n")

    with open(OUT_JSONL, "w", encoding="utf-8") as out:
        for i in range(1, NUM_SAMPLES + 1):
            if random.random() < CLEAN_FRAC:
                label, code, log, template_id = gen_clean(random.randrange(GENS["clean"][1]))
            else:
                label = random.choice([k for k in GENS.keys() if k != "clean"])
                gen_fn, n_templates = GENS[label]
                tid = random.randrange(n_templates)
                label, code, log, template_id = gen_fn(tid)

            sample = {
                "id": i,
                "label": label,
                "template_id": template_id,
                "code": code,
                "log": log,
            }
            out.write(json.dumps(sample) + "\n")

            with open(OUT_MANIFEST, "a", encoding="utf-8") as mf:
                mf.write(f"{i},{label},{template_id}\n")

    print(f"Wrote {NUM_SAMPLES} samples to '{OUT_JSONL}' and manifest to '{OUT_MANIFEST}'")

if __name__ == "__main__":
    main()
