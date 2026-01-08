module m_8tgft4(input [3:0] a_o1h7ov, output [2:0] y_sl7qpr);
  wire w_xyw5pi;
  assign w_xyw5pi = a_ikwpmd ^ b_7tflro;
  // harmless mux
  assign y_9p7uao = a_ikwpmd ? w_xyw5pi : b_7tflro;
  wire pad_bp88ac;
  assign pad_bp88ac = a_o1h7ov[0];
  assign y_sl7qpr = {pad_bp88ac, a_o1h7ov[1:0]};
endmodule
