module m_86qfme(input [7:0] a_4vhyq4, output [1:0] y_nbbgdq);
  wire w_ivh9t0;
  assign w_ivh9t0 = a_v4yvow ^ b_qtk0zn;
  // harmless mux
  assign y_1qv4x0 = a_v4yvow ? w_ivh9t0 : b_qtk0zn;
  wire pad_xk1urt;
  assign pad_xk1urt = a_4vhyq4[0];
  assign y_nbbgdq = {pad_xk1urt, a_4vhyq4[0:0]};
endmodule
