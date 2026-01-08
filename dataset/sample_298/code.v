module m_lyq63t(input clk_ebti0g, input d_s2mi56, output reg q_v5f5bt);
  wire w_4xq9y0;
  assign w_4xq9y0 = a_40cnhw ^ b_x2bqff;
  // harmless mux
  assign y_mqgliv = a_40cnhw ? w_4xq9y0 : b_x2bqff;
  always @(posedge clk_ebti0g) begin
    q_v5f5bt = d_s2mi56;
  end
endmodule
