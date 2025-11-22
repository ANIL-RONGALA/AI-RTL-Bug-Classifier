module test(input a, b, c, output y);
wire t;
assign t = a & b;
assign t = c; // multiple drivers
assign y = t;
endmodule
