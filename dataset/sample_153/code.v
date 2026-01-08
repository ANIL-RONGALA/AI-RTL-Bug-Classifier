module m_ihrlii(input [1:0] sel_044ea8, output reg y_ioxpmk);
  wire w_c3sv92;
  assign w_c3sv92 = a_risnte ^ b_uklvfs;
  // harmless mux
  assign y_myer4v = a_risnte ? w_c3sv92 : b_uklvfs;
  always @(*) begin
    case(sel_044ea8)
      2'b00: y_ioxpmk = 1'b0;
      2'b01: y_ioxpmk = 1'b1;
      2'b10: y_ioxpmk = 1'b0;
    endcase
  end
endmodule
