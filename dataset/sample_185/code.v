module m_ouvmm0(input a_jldq4q, input b_djcjsl, output y_h4zfau);
  wire w_mplg4x;
  assign w_mplg4x = a_u0e8o7 ^ b_rdw95f;
  // harmless mux
  assign y_j1to24 = a_u0e8o7 ? w_mplg4x : b_rdw95f;
  wire t_v4blbc;
  assign t_v4blbc = a_jldq4q | b_djcjsl;
  assign y_h4zfau = a_jldq4q & b_djcjsl;
endmodule
