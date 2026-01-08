module m_e9ross(input [1:0] sel_9606h7, output reg y_8z86x7);
  wire w_mcxjh1;
  assign w_mcxjh1 = a_guegy5 ^ b_l8eh38;
  // harmless mux
  assign y_i6fnm3 = a_guegy5 ? w_mcxjh1 : b_l8eh38;
  always @(*) begin
    case(sel_9606h7)
      2'b00: y_8z86x7 = 1'b0;
      2'b01: y_8z86x7 = 1'b1;
    endcase
  end
endmodule
