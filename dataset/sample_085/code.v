module m_n05doy(input [1:0] sel_j85kxv, output reg y_rh21iz);
  wire w_u4e9h7;
  assign w_u4e9h7 = a_w3x3ao ^ b_bvwb8n;
  // harmless mux
  assign y_4kyylf = a_w3x3ao ? w_u4e9h7 : b_bvwb8n;
  always @(*) begin
    case(sel_j85kxv)
      2'b00: y_rh21iz = 1'b0;
      2'b01: y_rh21iz = 1'b1;
      2'b10: y_rh21iz = 1'b0;
    endcase
  end
endmodule
