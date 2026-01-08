module m_xxgmrv(input en_xgfa0z, input d_0gzlcv, output reg q_08u0xe);
  wire w_a5c9kp;
  assign w_a5c9kp = a_03bk8l ^ b_1wj5pr;
  // harmless mux
  assign y_r9z5e4 = a_03bk8l ? w_a5c9kp : b_1wj5pr;
  always @(*) begin
    if (en_xgfa0z) q_08u0xe = d_0gzlcv;
  end
endmodule
