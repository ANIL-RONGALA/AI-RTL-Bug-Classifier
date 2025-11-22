module test(input [3:0] a, output [1:0] y);
assign y = a; // width mismatch
endmodule
