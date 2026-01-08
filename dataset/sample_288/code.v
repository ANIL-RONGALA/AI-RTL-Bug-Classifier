module m_gtau0c(input en_1juoz6, input d_16gopk, output reg q_4us1gv);
  wire w_76c3ql;
  assign w_76c3ql = a_tsxp4z ^ b_yx7jrq;
  // harmless mux
  assign y_je3h52 = a_tsxp4z ? w_76c3ql : b_yx7jrq;
  always @(*) begin
    if (en_1juoz6) q_4us1gv = d_16gopk;
  end
endmodule
