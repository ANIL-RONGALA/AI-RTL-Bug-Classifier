module m_yuzwse(input [1:0] sel_1mcey6, output reg y_y8kd2o);
  wire w_w4wute;
  assign w_w4wute = a_76g6kp ^ b_bp7d35;
  // harmless mux
  assign y_kgqu8w = a_76g6kp ? w_w4wute : b_bp7d35;
  always @(*) begin
    case(sel_1mcey6)
      2'b00: y_y8kd2o = 1'b0;
      2'b01: y_y8kd2o = 1'b1;
      2'b10: y_y8kd2o = 1'b0;
    endcase
  end
endmodule
