module m_hzgt2u(input clk_8qvpd0, input d_93b5es, output reg q_6oljbn);
  wire w_ikd27m;
  assign w_ikd27m = a_wfo7n1 ^ b_s0q4yr;
  // harmless mux
  assign y_50ij5e = a_wfo7n1 ? w_ikd27m : b_s0q4yr;
  always @(posedge clk_8qvpd0) begin
    q_6oljbn = d_93b5es;
  end
endmodule
