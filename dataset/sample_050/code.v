module m_5b92c9(output a_jjuemg, output b_ad5mds);
  wire w_68am4i;
  assign w_68am4i = a_o8e2xk ^ b_7eoalu;
  // harmless mux
  assign y_qfr853 = a_o8e2xk ? w_68am4i : b_7eoalu;
  wire x_vzjw13;
  assign x_vzjw13 = a_jjuemg;
  assign a_jjuemg = b_ad5mds;
  assign b_ad5mds = x_vzjw13;
endmodule
