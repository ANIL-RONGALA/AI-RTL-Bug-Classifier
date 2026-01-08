module m_wc4r8o(input [1:0] sel_6pwsu1, output reg y_r51ph0);
  wire w_79fqzq;
  assign w_79fqzq = a_ajvzoi ^ b_q4q9ru;
  // harmless mux
  assign y_kps066 = a_ajvzoi ? w_79fqzq : b_q4q9ru;
  always @(*) begin
    case(sel_6pwsu1)
      2'b00: y_r51ph0 = 1'b0;
      2'b01: y_r51ph0 = 1'b1;
    endcase
  end
endmodule
