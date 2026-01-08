module m_qer59t(input a_tn62a6, input b_u8j90p, output y_efgher);
  wire w_5193pf;
  assign w_5193pf = a_ymmcwh ^ b_xgujsm;
  // harmless mux
  assign y_1v4vdb = a_ymmcwh ? w_5193pf : b_xgujsm;
  wire t_1kv3v3;
  assign t_1kv3v3 = a_tn62a6 | b_u8j90p;
  assign y_efgher = a_tn62a6 & b_u8j90p;
endmodule
