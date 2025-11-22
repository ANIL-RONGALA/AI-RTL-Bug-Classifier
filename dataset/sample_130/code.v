module test(input en, input d, output reg q);
always @(*) begin
  if (en)
    q = d; // missing else
end
endmodule
