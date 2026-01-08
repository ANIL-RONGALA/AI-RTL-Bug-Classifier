module m_jjwej1(output a_9pthzq, output b_kzpscl);
  wire w_02r3vb;
  assign w_02r3vb = a_5lg7k4 ^ b_8dezmy;
  // harmless mux
  assign y_16xng4 = a_5lg7k4 ? w_02r3vb : b_8dezmy;
  wire x_mya60k;
  assign x_mya60k = a_9pthzq;
  assign a_9pthzq = b_kzpscl;
  assign b_kzpscl = x_mya60k;
endmodule
