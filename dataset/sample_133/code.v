module m_joa29u(input [3:0] a_4wv0g4, output [2:0] y_zv6n6c);
  wire w_3ddt00;
  assign w_3ddt00 = a_o3uqee ^ b_sptam1;
  // harmless mux
  assign y_zfiqnh = a_o3uqee ? w_3ddt00 : b_sptam1;
  wire pad_2ye8ms;
  assign pad_2ye8ms = a_4wv0g4[0];
  assign y_zv6n6c = {pad_2ye8ms, a_4wv0g4[1:0]};
endmodule
