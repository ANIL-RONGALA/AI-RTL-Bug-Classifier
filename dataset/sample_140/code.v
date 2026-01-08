module m_84dvem(input [1:0] sel_n6odz5, output reg y_r991q1);
  wire w_0ha7d6;
  assign w_0ha7d6 = a_7xgg9r ^ b_wylmo9;
  // harmless mux
  assign y_g4b91b = a_7xgg9r ? w_0ha7d6 : b_wylmo9;
  always @(*) begin
    case(sel_n6odz5)
      2'b00: y_r991q1 = 1'b0;
      2'b01: y_r991q1 = 1'b1;
      2'b10: y_r991q1 = 1'b0;
    endcase
  end
endmodule
