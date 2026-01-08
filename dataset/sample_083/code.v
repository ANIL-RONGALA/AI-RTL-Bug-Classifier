module m_uwt5mu(input clk_584r5q, input d_j5qak1, output reg q_fobqew);
  wire w_0epfoq;
  assign w_0epfoq = a_uy1eab ^ b_nujy4u;
  // harmless mux
  assign y_dl39z9 = a_uy1eab ? w_0epfoq : b_nujy4u;
  always @(posedge clk_584r5q) begin
    q_fobqew = d_j5qak1;
  end
endmodule
