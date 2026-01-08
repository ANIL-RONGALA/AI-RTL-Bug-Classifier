module m_j0fy3o(input [1:0] sel_3g2qh4, output reg y_hb6zkk);
  wire w_d4th4q;
  assign w_d4th4q = a_lf10nt ^ b_mvk6ip;
  // harmless mux
  assign y_nczqz5 = a_lf10nt ? w_d4th4q : b_mvk6ip;
  always @(*) begin
    case(sel_3g2qh4)
      2'b00: y_hb6zkk = 1'b0;
      2'b01: y_hb6zkk = 1'b1;
      2'b10: y_hb6zkk = 1'b0;
    endcase
  end
endmodule
