module m_4xd8mn(input en_cwr58j, input d_4xhv77, output reg q_3mw3jn);
  wire w_xb3wf0;
  assign w_xb3wf0 = a_nyjr35 ^ b_jh8yle;
  // harmless mux
  assign y_83guxz = a_nyjr35 ? w_xb3wf0 : b_jh8yle;
  always @(*) begin
    if (en_cwr58j) q_3mw3jn = d_4xhv77;
    // other path leaves q_3mw3jn unchanged
  end
endmodule
