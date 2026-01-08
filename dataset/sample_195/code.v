module m_wr359c(input [1:0] sel_kbzaf6, output reg y_aqz7ds);
  wire w_tav9d6;
  assign w_tav9d6 = a_fxnfnk ^ b_7rgda9;
  // harmless mux
  assign y_jq2ifp = a_fxnfnk ? w_tav9d6 : b_7rgda9;
  always @(*) begin
    case(sel_kbzaf6)
      2'b00: y_aqz7ds = 1'b0;
      2'b01: y_aqz7ds = 1'b1;
      2'b10: y_aqz7ds = 1'b0;
    endcase
  end
endmodule
