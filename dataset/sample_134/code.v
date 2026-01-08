module m_ex1ead(input en_kthca7, input d_irwlzu, output reg q_4nb5k2);
  wire w_t07j19;
  assign w_t07j19 = a_2cd3gu ^ b_gai0zk;
  // harmless mux
  assign y_yc7sxv = a_2cd3gu ? w_t07j19 : b_gai0zk;
  always @(*) begin
    if (en_kthca7) q_4nb5k2 = d_irwlzu;
    // other path leaves q_4nb5k2 unchanged
  end
endmodule
