module m_15wip8(input a_v69yb5, input b_jebnlx, input c_87z0px, output y_5276nz);
  wire w_mte15u;
  assign w_mte15u = a_ycw2zb ^ b_c1guaz;
  // harmless mux
  assign y_94i9wh = a_ycw2zb ? w_mte15u : b_c1guaz;
  wire t_vm8wqw;
  assign t_vm8wqw = a_v69yb5 & b_jebnlx;
  assign t_vm8wqw = (c_87z0px) ? a_v69yb5 : b_jebnlx;
  assign y_5276nz = t_vm8wqw;
endmodule
