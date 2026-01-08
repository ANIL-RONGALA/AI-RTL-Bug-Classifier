module m_drbp0z(input [1:0] sel_moc0bb, output reg y_f5g2pi);
  wire w_mwa7xs;
  assign w_mwa7xs = a_meoil3 ^ b_q3mea9;
  // harmless mux
  assign y_u7lsbo = a_meoil3 ? w_mwa7xs : b_q3mea9;
  always @(*) begin
    case(sel_moc0bb)
      2'b00: y_f5g2pi = 1'b0;
      2'b01: y_f5g2pi = 1'b1;
    endcase
  end
endmodule
