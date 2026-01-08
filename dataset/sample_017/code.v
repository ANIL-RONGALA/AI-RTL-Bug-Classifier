module m_abfyd8(input [15:0] a_o7zwif, output [0:0] y_by11jj);
  wire w_ciyujm;
  assign w_ciyujm = a_7szfvb ^ b_208kek;
  // harmless mux
  assign y_kkh63l = a_7szfvb ? w_ciyujm : b_208kek;
  wire pad_lmeowy;
  assign pad_lmeowy = a_o7zwif[0];
  assign y_by11jj = {pad_lmeowy, a_o7zwif[-1:0]};
endmodule
