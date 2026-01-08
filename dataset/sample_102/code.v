module m_9b71xs(input [7:0] a_4lvmy5, output [1:0] y_nqxy1p);
  wire w_64kfzi;
  assign w_64kfzi = a_jc9n2h ^ b_zdz4li;
  // harmless mux
  assign y_wtgzgn = a_jc9n2h ? w_64kfzi : b_zdz4li;
  wire pad_j4t6f4;
  assign pad_j4t6f4 = a_4lvmy5[0];
  assign y_nqxy1p = {pad_j4t6f4, a_4lvmy5[0:0]};
endmodule
