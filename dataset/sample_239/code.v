module test(input [1:0] sel, output reg y);
always @(*) begin
  case(sel)
    2'b00: y = 0;
    2'b01: y = 1;
  endcase
end
endmodule
