module m_qsbvig(input a_u8il6c, input b_neq2yn, input c_l2m5zh, output y_puasnr);
  wire w_tkzi0d;
  assign w_tkzi0d = a_fq03oh ^ b_ddhg54;
  // harmless mux
  assign y_1vmrsp = a_fq03oh ? w_tkzi0d : b_ddhg54;
  wire t_omhw3c;
  assign t_omhw3c = a_u8il6c & b_neq2yn;
  assign t_omhw3c = (c_l2m5zh) ? a_u8il6c : b_neq2yn;
  assign y_puasnr = t_omhw3c;
endmodule
