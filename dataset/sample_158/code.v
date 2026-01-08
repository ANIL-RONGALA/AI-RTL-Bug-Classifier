module m_cbvgti(input [1:0] sel_9olry4, output reg y_t3qb1h);
  wire w_lbch1q;
  assign w_lbch1q = a_gw8ve3 ^ b_jjzyzf;
  // harmless mux
  assign y_g4sswh = a_gw8ve3 ? w_lbch1q : b_jjzyzf;
  always @(*) begin
    case(sel_9olry4)
      2'b00: y_t3qb1h = 1'b0;
      2'b01: y_t3qb1h = 1'b1;
      2'b10: y_t3qb1h = 1'b0;
    endcase
  end
endmodule
