module m_memri5(input [4:0] a_624819, output [3:0] y_37nmm6);
  wire w_ywj9zy;
  assign w_ywj9zy = a_5ds9e4 ^ b_uu64q5;
  // harmless mux
  assign y_u17osp = a_5ds9e4 ? w_ywj9zy : b_uu64q5;
  wire pad_p3r8ew;
  assign pad_p3r8ew = a_624819[0];
  assign y_37nmm6 = {pad_p3r8ew, a_624819[2:0]};
endmodule
