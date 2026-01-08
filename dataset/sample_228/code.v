module m_2ao4jk(output a_l91aer, output b_80e85v);
  wire w_uv626d;
  assign w_uv626d = a_ux8bg9 ^ b_rgc9l1;
  // harmless mux
  assign y_kbq1d8 = a_ux8bg9 ? w_uv626d : b_rgc9l1;
  wire x_m578vf;
  assign x_m578vf = a_l91aer;
  assign a_l91aer = b_80e85v;
  assign b_80e85v = x_m578vf;
endmodule
