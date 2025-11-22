# src/dataset_generator.py

import os
import random

# Root relative to project root (when run as: python src/dataset_generator.py)
DATASET_ROOT = "dataset"

bug_classes = {
    "syntax_error": [
        (
            "module test(input a, b output y); assign y = a & b endmodule",
            "Error: syntax error near 'output'"
        ),
        (
            "module test(a, b, y) input a, b; output y assign y = a | b; endmodule",
            "Error: missing ';' before 'assign'"
        )
    ],
    "latch_inference": [
        (
            "module test(input en, input d, output reg q);\n"
            "always @(*) begin\n"
            "  if (en)\n"
            "    q = d; // missing else\n"
            "end\n"
            "endmodule\n",
            "Warning: Latch inferred for signal 'q'."
        )
    ],
    "width_mismatch": [
        (
            "module test(input [3:0] a, output [1:0] y);\n"
            "assign y = a; // width mismatch\n"
            "endmodule\n",
            "Error: width mismatch: assigning 4 bits to 2-bit signal 'y'."
        )
    ],
    "blocking_misuse": [
        (
            "module test(input clk, input d, output reg q);\n"
            "always @(posedge clk) begin\n"
            "  q = d; // should be non-blocking\n"
            "end\n"
            "endmodule\n",
            "Warning: blocking assignment in sequential block for 'q'."
        )
    ],
    "unused_signal": [
        (
            "module test(input a, b, output y);\n"
            "wire temp;\n"
            "assign y = a & b;\n"
            "endmodule\n",
            "Warning: signal 'temp' declared but never used."
        )
    ],
    "missing_default": [
        (
            "module test(input [1:0] sel, output reg y);\n"
            "always @(*) begin\n"
            "  case(sel)\n"
            "    2'b00: y = 0;\n"
            "    2'b01: y = 1;\n"
            "  endcase\n"
            "end\n"
            "endmodule\n",
            "Warning: case statement has no default item."
        )
    ],
    "multi_driver": [
        (
            "module test(input a, b, c, output y);\n"
            "wire t;\n"
            "assign t = a & b;\n"
            "assign t = c; // multiple drivers\n"
            "assign y = t;\n"
            "endmodule\n",
            "Error: multiple continuous drivers for net 't'."
        )
    ],
    "comb_loop": [
        (
            "module test(output a, b);\n"
            "assign a = b;\n"
            "assign b = a; // combinational loop\n"
            "endmodule\n",
            "Error: combinational loop involving signals 'a' and 'b'."
        )
    ]
}

def main():
    os.makedirs(DATASET_ROOT, exist_ok=True)
    num_samples = 300
    counter = 1

    for _ in range(num_samples):
        bug = random.choice(list(bug_classes.keys()))
        code, log = random.choice(bug_classes[bug])

        folder = os.path.join(DATASET_ROOT, f"sample_{counter:03d}")
        os.makedirs(folder, exist_ok=True)

        with open(os.path.join(folder, "code.v"), "w") as f:
            f.write(code)

        with open(os.path.join(folder, "log.txt"), "w") as f:
            f.write(log)

        with open(os.path.join(folder, "label.txt"), "w") as f:
            f.write(bug)

        counter += 1

    print(f"Generated {num_samples} samples in '{DATASET_ROOT}/'.")


if __name__ == "__main__":
    main()
