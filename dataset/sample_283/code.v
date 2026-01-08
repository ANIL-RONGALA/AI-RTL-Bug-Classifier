module m_7oykjn(input en_y0r254, input d_tkqi2l, output reg q_twljh8);
  wire w_pwvh83;
  assign w_pwvh83 = a_zmymwp ^ b_u3163t;
  // harmless mux
  assign y_c7rmm2 = a_zmymwp ? w_pwvh83 : b_u3163t;
  always @(*) begin
    if (en_y0r254) q_twljh8 = d_tkqi2l;
    // other path leaves q_twljh8 unchanged
  end
endmodule
