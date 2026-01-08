module m_r3myiz(input [7:0] a_9f5lgu, output [1:0] y_b52zmm);
  wire w_6poezz;
  assign w_6poezz = a_l65k5s ^ b_obe8g0;
  // harmless mux
  assign y_rph9ct = a_l65k5s ? w_6poezz : b_obe8g0;
  wire pad_b8zmyv;
  assign pad_b8zmyv = a_9f5lgu[0];
  assign y_b52zmm = {pad_b8zmyv, a_9f5lgu[0:0]};
endmodule
