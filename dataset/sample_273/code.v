module test(output a, b);
assign a = b;
assign b = a; // combinational loop
endmodule
