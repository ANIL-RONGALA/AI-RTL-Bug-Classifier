module m_rj04j4(input [2:0] a_k5dki4, output [1:0] y_ys26bl);
  wire w_g2fyaz;
  assign w_g2fyaz = a_a93g2r ^ b_egu4wz;
  // harmless mux
  assign y_vv9r81 = a_a93g2r ? w_g2fyaz : b_egu4wz;
  wire pad_xka0ax;
  assign pad_xka0ax = a_k5dki4[0];
  assign y_ys26bl = {pad_xka0ax, a_k5dki4[0:0]};
endmodule
