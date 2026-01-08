module m_mzm9l2(input [3:0] a_xkm8wm, output [1:0] y_amb3b3);
  wire w_7l1v2w;
  assign w_7l1v2w = a_xn1ro8 ^ b_h28xmn;
  // harmless mux
  assign y_27k6zg = a_xn1ro8 ? w_7l1v2w : b_h28xmn;
  wire pad_nrrfuk;
  assign pad_nrrfuk = a_xkm8wm[0];
  assign y_amb3b3 = {pad_nrrfuk, a_xkm8wm[0:0]};
endmodule
