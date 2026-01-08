module m_rlmg9v(input en_2rf2tm, input d_n6qtzb, output reg q_jk8yv1);
  wire w_r9bk9r;
  assign w_r9bk9r = a_9158sv ^ b_3t2dc1;
  // harmless mux
  assign y_ctpctt = a_9158sv ? w_r9bk9r : b_3t2dc1;
  always @(*) begin
    if (en_2rf2tm) q_jk8yv1 = d_n6qtzb;
    // other path leaves q_jk8yv1 unchanged
  end
endmodule
