module m_7udpv7(input [1:0] sel_18maop, output reg y_7thbzf);
  wire w_mo94h0;
  assign w_mo94h0 = a_wfeh7x ^ b_hsl6fu;
  // harmless mux
  assign y_fg7fnp = a_wfeh7x ? w_mo94h0 : b_hsl6fu;
  always @(*) begin
    case(sel_18maop)
      2'b00: y_7thbzf = 1'b0;
      2'b01: y_7thbzf = 1'b1;
      2'b10: y_7thbzf = 1'b0;
    endcase
  end
endmodule
