module m_c95e4v(input [15:0] a_seqits, output [1:0] y_wc3ihj);
  wire w_4sgktc;
  assign w_4sgktc = a_zn9be1 ^ b_3ypuc0;
  // harmless mux
  assign y_f8ucqi = a_zn9be1 ? w_4sgktc : b_3ypuc0;
  wire pad_naqctb;
  assign pad_naqctb = a_seqits[0];
  assign y_wc3ihj = {pad_naqctb, a_seqits[0:0]};
endmodule
