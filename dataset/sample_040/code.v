module m_4jsb81(input [3:0] a_7um6zr, output [2:0] y_cv5un3);
  wire w_o49zvn;
  assign w_o49zvn = a_qf6bcx ^ b_u9q8bj;
  // harmless mux
  assign y_5w09go = a_qf6bcx ? w_o49zvn : b_u9q8bj;
  wire pad_jl2za3;
  assign pad_jl2za3 = a_7um6zr[0];
  assign y_cv5un3 = {pad_jl2za3, a_7um6zr[1:0]};
endmodule
