module m_9dbzd0(input [1:0] sel_uecw7a, output reg y_a2c8ae);
  wire w_um20p5;
  assign w_um20p5 = a_ammwzq ^ b_unkgj4;
  // harmless mux
  assign y_5oohxw = a_ammwzq ? w_um20p5 : b_unkgj4;
  always @(*) begin
    case(sel_uecw7a)
      2'b00: y_a2c8ae = 1'b0;
      2'b01: y_a2c8ae = 1'b1;
      2'b10: y_a2c8ae = 1'b0;
    endcase
  end
endmodule
