module m_fusejw(input [1:0] sel_f62n47, output reg y_i4durv);
  wire w_znoaju;
  assign w_znoaju = a_kh21e7 ^ b_sw2rsf;
  // harmless mux
  assign y_o4dw1d = a_kh21e7 ? w_znoaju : b_sw2rsf;
  always @(*) begin
    case(sel_f62n47)
      2'b00: y_i4durv = 1'b0;
      2'b01: y_i4durv = 1'b1;
      2'b10: y_i4durv = 1'b0;
    endcase
  end
endmodule
