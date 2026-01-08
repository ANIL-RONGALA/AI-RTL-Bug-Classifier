module m_k1o4i6(input en_l910xq, input d_m0d7pp, output reg q_6v8e4a);
  wire w_ic97cp;
  assign w_ic97cp = a_5g1pfg ^ b_8ngjsw;
  // harmless mux
  assign y_nl1aed = a_5g1pfg ? w_ic97cp : b_8ngjsw;
  always @(*) begin
    if (en_l910xq) q_6v8e4a = d_m0d7pp;
    // other path leaves q_6v8e4a unchanged
  end
endmodule
