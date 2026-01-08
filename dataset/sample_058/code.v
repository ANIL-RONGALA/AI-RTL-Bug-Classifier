module m_yx57cp(input a_ts6aee, input b_kbvcuj, output y_qxmm1f);
  wire w_3iit76;
  assign w_3iit76 = a_xekef2 ^ b_21ui71;
  // harmless mux
  assign y_mahalt = a_xekef2 ? w_3iit76 : b_21ui71;
  wire t_w41ba4;
  assign t_w41ba4 = a_ts6aee | b_kbvcuj;
  assign y_qxmm1f = a_ts6aee & b_kbvcuj;
endmodule
