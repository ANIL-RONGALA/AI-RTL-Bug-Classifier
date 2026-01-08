module m_au7bvv(input [1:0] sel_5x66pl, output reg y_mr1m5c);
  wire w_joe7sz;
  assign w_joe7sz = a_9txhld ^ b_t61kce;
  // harmless mux
  assign y_5fnu9q = a_9txhld ? w_joe7sz : b_t61kce;
  always @(*) begin
    case(sel_5x66pl)
      2'b00: y_mr1m5c = 1'b0;
      2'b01: y_mr1m5c = 1'b1;
    endcase
  end
endmodule
