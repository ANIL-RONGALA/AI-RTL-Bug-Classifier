module m_79mc3a(input clk_6bf95t, input d_94tu2h, output reg q_0fir4i);
  wire w_k5as5l;
  assign w_k5as5l = a_szj01u ^ b_t0gjvb;
  // harmless mux
  assign y_jrkzxo = a_szj01u ? w_k5as5l : b_t0gjvb;
  always @(posedge clk_6bf95t) begin
    reg tmp_zsulq2;
    tmp_zsulq2 = d_94tu2h;
    q_0fir4i = tmp_zsulq2;
  end
endmodule
