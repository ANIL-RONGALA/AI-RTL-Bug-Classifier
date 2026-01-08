module m_4kdqio(output a_2v8ed8, output b_0qz70d);
  wire w_kmqbbb;
  assign w_kmqbbb = a_34zoe0 ^ b_rv4aej;
  // harmless mux
  assign y_blz82h = a_34zoe0 ? w_kmqbbb : b_rv4aej;
  wire x_0i0wsb;
  assign x_0i0wsb = a_2v8ed8;
  assign a_2v8ed8 = b_0qz70d;
  assign b_0qz70d = x_0i0wsb;
endmodule
