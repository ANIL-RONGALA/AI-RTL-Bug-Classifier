# src/dataset_generator.py
import os
import random
import re
import string

DATASET_ROOT = "dataset"
NUM_SAMPLES = 300

BANNED_LOG_WORDS = {
    "latch", "width", "mismatch", "driver", "default", "blocking",
    "unused", "loop", "combinational"
}

def rident(prefix="s", k=6):
    alphabet = string.ascii_lowercase + string.digits
    return f"{prefix}_" + "".join(random.choice(alphabet) for _ in range(k))

def safe_log(msg: str) -> str:
    low = msg.lower()
    if any(w in low for w in BANNED_LOG_WORDS):
        raise ValueError(f"Log leaks label word: {msg}")
    return msg

def distractor_block():
    # Small correct logic to add noise and realism
    a = rident("a")
    b = rident("b")
    w = rident("w")
    y = rident("y")
    return (
        f"  wire {w};\n"
        f"  assign {w} = {a} ^ {b};\n"
        f"  // harmless mux\n"
        f"  assign {y} = {a} ? {w} : {b};\n"
    )

def gen_clean():
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    code = (
        f"module {m}(input {a}, input {b}, output {y});\n"
        f"{distractor_block()}"
        f"  assign {y} = {a} & {b};\n"
        f"endmodule\n"
    )
    log = safe_log("Info: analysis completed with no critical issues.")
    return "clean", code, log, "clean_0"

def gen_latch(template_id: int):
    m = rident("m")
    en = rident("en")
    d = rident("d")
    q = rident("q")
    code = (
        f"module {m}(input {en}, input {d}, output reg {q});\n"
        f"{distractor_block()}"
        f"  always @(*) begin\n"
    )
    if template_id == 0:
        # missing else
        code += f"    if ({en}) {q} = {d};\n"
    else:
        # no default assignment + partial if
        code += f"    if ({en}) {q} = {d};\n"
        code += f"    // other path leaves {q} unchanged\n"
    code += "  end\nendmodule\n"
    log = safe_log(f"Warning: signal '{q}' may not be assigned on all control paths.")
    return "latch_inference", code, log, f"latch_{template_id}"

def gen_width(template_id: int):
    m = rident("m")
    inw = random.choice([3,4,5,8,16])
    outw = random.choice([1,2,3,4])
    if outw >= inw:
        outw = max(1, inw - 1)
    a = rident("a")
    y = rident("y")
    code = (
        f"module {m}(input [{inw-1}:0] {a}, output [{outw-1}:0] {y});\n"
        f"{distractor_block()}"
    )
    if template_id == 0:
        code += f"  assign {y} = {a};\n"
    else:
        # concatenation variant
        pad = rident("pad")
        code += f"  wire {pad};\n"
        code += f"  assign {pad} = {a}[0];\n"
        code += f"  assign {y} = {{{pad}, {a}[{outw-2}:0]}};\n"
    code += "endmodule\n"
    log = safe_log(f"Warning: implicit truncation/extension may occur on assignment to '{y}'.")
    return "width_mismatch", code, log, f"width_{template_id}"

def gen_blocking(template_id: int):
    m = rident("m")
    clk = rident("clk")
    d = rident("d")
    q = rident("q")
    code = (
        f"module {m}(input {clk}, input {d}, output reg {q});\n"
        f"{distractor_block()}"
        f"  always @(posedge {clk}) begin\n"
    )
    if template_id == 0:
        code += f"    {q} = {d};\n"            # blocking in sequential
    else:
        tmp = rident("tmp")
        code += f"    reg {tmp};\n"
        code += f"    {tmp} = {d};\n"
        code += f"    {q} = {tmp};\n"
    code += "  end\nendmodule\n"
    log = safe_log(f"Warning: assignment style in clocked block may cause mismatch for '{q}'.")
    return "blocking_misuse", code, log, f"blocking_{template_id}"

def gen_unused(template_id: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    temp = rident("t")
    code = (
        f"module {m}(input {a}, input {b}, output {y});\n"
        f"{distractor_block()}"
        f"  wire {temp};\n"
    )
    if template_id == 0:
        code += f"  assign {y} = {a} & {b};\n"
    else:
        # assigned but unused
        code += f"  assign {temp} = {a} | {b};\n"
        code += f"  assign {y} = {a} & {b};\n"
    code += "endmodule\n"
    log = safe_log(f"Warning: declaration '{temp}' does not affect outputs.")
    return "unused_signal", code, log, f"unused_{template_id}"

def gen_missing_default(template_id: int):
    m = rident("m")
    sel = rident("sel")
    y = rident("y")
    code = (
        f"module {m}(input [1:0] {sel}, output reg {y});\n"
        f"{distractor_block()}"
        f"  always @(*) begin\n"
        f"    case({sel})\n"
        f"      2'b00: {y} = 1'b0;\n"
        f"      2'b01: {y} = 1'b1;\n"
    )
    if template_id == 1:
        code += f"      2'b10: {y} = 1'b0;\n"
    code += (
        f"    endcase\n"
        f"  end\n"
        f"endmodule\n"
    )
    log = safe_log("Warning: not all select values are handled in case statement.")
    return "missing_default", code, log, f"case_{template_id}"

def gen_multi_driver(template_id: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    c = rident("c")
    y = rident("y")
    t = rident("t")
    code = (
        f"module {m}(input {a}, input {b}, input {c}, output {y});\n"
        f"{distractor_block()}"
        f"  wire {t};\n"
    )
    if template_id == 0:
        code += f"  assign {t} = {a} & {b};\n  assign {t} = {c};\n"
    else:
        # two assigns separated by conditional generate noise
        code += f"  assign {t} = {a} & {b};\n"
        code += f"  assign {t} = ({c}) ? {a} : {b};\n"
    code += f"  assign {y} = {t};\nendmodule\n"
    log = safe_log(f"Error: net '{t}' is driven from more than one continuous source.")
    return "multi_driver", code, log, f"mdrv_{template_id}"

def gen_comb_loop(template_id: int):
    m = rident("m")
    a = rident("a")
    b = rident("b")
    code = (
        f"module {m}(output {a}, output {b});\n"
        f"{distractor_block()}"
    )
    if template_id == 0:
        code += f"  assign {a} = {b};\n  assign {b} = {a};\n"
    else:
        x = rident("x")
        code += f"  wire {x};\n"
        code += f"  assign {x} = {a};\n"
        code += f"  assign {a} = {b};\n"
        code += f"  assign {b} = {x};\n"
    code += "endmodule\n"
    log = safe_log("Error: zero-delay feedback detected among continuous assignments.")
    return "comb_loop", code, log, f"loop_{template_id}"

def gen_syntax(template_id: int):
    # Syntax errors inherently look obvious; still randomize to avoid memorization
    m = rident("m")
    a = rident("a")
    b = rident("b")
    y = rident("y")
    if template_id == 0:
        code = f"module {m}(input {a}, {b} output {y}); assign {y} = {a} & {b} endmodule"
        log = "Error: parse failed near port list."
    else:
        code = f"module {m}({a}, {b}, {y}) input {a}, {b}; output {y} assign {y} = {a} | {b}; endmodule"
        log = "Error: expected ';' before statement."
    # don't safe_log() syntax logs; they might include words, but no class leakage is needed here
    return "syntax_error", code, log, f"syntax_{template_id}"

GENS = {
    "clean": (gen_clean, 1),
    "syntax_error": (gen_syntax, 2),
    "latch_inference": (gen_latch, 2),
    "width_mismatch": (gen_width, 2),
    "blocking_misuse": (gen_blocking, 2),
    "unused_signal": (gen_unused, 2),
    "missing_default": (gen_missing_default, 2),
    "multi_driver": (gen_multi_driver, 2),
    "comb_loop": (gen_comb_loop, 2),
}

def main():
    os.makedirs(DATASET_ROOT, exist_ok=True)

    manifest_path = os.path.join(DATASET_ROOT, "manifest.csv")
    with open(manifest_path, "w") as mf:
        mf.write("sample_id,label,template_id\n")

    counter = 1
    for _ in range(NUM_SAMPLES):
        # 25% clean samples
        if random.random() < 0.25:
            label, code, log, template_id = gen_clean()
        else:
            label = random.choice([k for k in GENS.keys() if k != "clean"])
            gen_fn, n_templates = GENS[label]
            tid = random.randrange(n_templates)
            label, code, log, template_id = gen_fn(tid)

        folder = os.path.join(DATASET_ROOT, f"sample_{counter:03d}")
        os.makedirs(folder, exist_ok=True)

        with open(os.path.join(folder, "code.v"), "w") as f:
            f.write(code)

        with open(os.path.join(folder, "log.txt"), "w") as f:
            f.write(log)

        with open(os.path.join(folder, "label.txt"), "w") as f:
            f.write(label)

        with open(manifest_path, "a") as mf:
            mf.write(f"sample_{counter:03d},{label},{template_id}\n")

        counter += 1

    print(f"Generated {NUM_SAMPLES} samples in '{DATASET_ROOT}/' and wrote manifest.csv")

if __name__ == "__main__":
    main()
