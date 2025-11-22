module test(input clk, input d, output reg q);
always @(posedge clk) begin
  q = d; // should be non-blocking
end
endmodule
