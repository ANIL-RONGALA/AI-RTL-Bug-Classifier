module m_ikhd1m(input [3:0] a_hvj5ov, output [1:0] y_vun3t1);
  wire w_zd3fvx;
  assign w_zd3fvx = a_8z5u3f ^ b_rjyz9x;
  // harmless mux
  assign y_95vlkn = a_8z5u3f ? w_zd3fvx : b_rjyz9x;
  wire pad_j8lx90;
  assign pad_j8lx90 = a_hvj5ov[0];
  assign y_vun3t1 = {pad_j8lx90, a_hvj5ov[0:0]};
endmodule
