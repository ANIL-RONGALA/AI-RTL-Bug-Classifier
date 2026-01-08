module m_eo3l1j(input [2:0] a_14289x, output [1:0] y_7cuc9k);
  wire w_kqz41o;
  assign w_kqz41o = a_lf8tmo ^ b_j56dsf;
  // harmless mux
  assign y_uhffc3 = a_lf8tmo ? w_kqz41o : b_j56dsf;
  wire pad_xa7hx0;
  assign pad_xa7hx0 = a_14289x[0];
  assign y_7cuc9k = {pad_xa7hx0, a_14289x[0:0]};
endmodule
