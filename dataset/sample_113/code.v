module m_weiop0(input a_ju5q8t, input b_tiedfk, input c_gvnkuz, output y_qrm0nd);
  wire w_vs5327;
  assign w_vs5327 = a_k7brtn ^ b_plldg6;
  // harmless mux
  assign y_a20ghq = a_k7brtn ? w_vs5327 : b_plldg6;
  wire t_bwknxe;
  assign t_bwknxe = a_ju5q8t & b_tiedfk;
  assign t_bwknxe = (c_gvnkuz) ? a_ju5q8t : b_tiedfk;
  assign y_qrm0nd = t_bwknxe;
endmodule
