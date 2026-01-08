module m_2drp8h(input clk_nnxgv6, input d_d4u4dr, output reg q_u62lpt);
  wire w_puym3r;
  assign w_puym3r = a_0q3cqz ^ b_tgdcoz;
  // harmless mux
  assign y_1nf9b7 = a_0q3cqz ? w_puym3r : b_tgdcoz;
  always @(posedge clk_nnxgv6) begin
    q_u62lpt = d_d4u4dr;
  end
endmodule
