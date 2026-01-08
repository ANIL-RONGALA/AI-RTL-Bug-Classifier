module m_l43u05(input clk_uzlwk7, input d_h0gim8, output reg q_icmsbg);
  wire w_oiuuvs;
  assign w_oiuuvs = a_xtxf6b ^ b_fq1s78;
  // harmless mux
  assign y_vnbu6n = a_xtxf6b ? w_oiuuvs : b_fq1s78;
  always @(posedge clk_uzlwk7) begin
    reg tmp_whq2a6;
    tmp_whq2a6 = d_h0gim8;
    q_icmsbg = tmp_whq2a6;
  end
endmodule
