module m_4a1azd(input [15:0] a_u7lck6, output [0:0] y_6nsulo);
  wire w_pqa7a1;
  assign w_pqa7a1 = a_pmcxin ^ b_o30tnc;
  // harmless mux
  assign y_lhw5pm = a_pmcxin ? w_pqa7a1 : b_o30tnc;
  wire pad_z7txpl;
  assign pad_z7txpl = a_u7lck6[0];
  assign y_6nsulo = {pad_z7txpl, a_u7lck6[-1:0]};
endmodule
