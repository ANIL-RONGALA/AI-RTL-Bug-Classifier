module m_8je9pl(input [1:0] sel_t82pq5, output reg y_l8vlwy);
  wire w_dqkmu3;
  assign w_dqkmu3 = a_bat17w ^ b_x6xk4y;
  // harmless mux
  assign y_2qni1o = a_bat17w ? w_dqkmu3 : b_x6xk4y;
  always @(*) begin
    case(sel_t82pq5)
      2'b00: y_l8vlwy = 1'b0;
      2'b01: y_l8vlwy = 1'b1;
      2'b10: y_l8vlwy = 1'b0;
    endcase
  end
endmodule
