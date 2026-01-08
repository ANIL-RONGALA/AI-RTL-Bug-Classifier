module m_1jaccq(input [1:0] sel_46ry8q, output reg y_mqctxk);
  wire w_ih0nvr;
  assign w_ih0nvr = a_j4cydt ^ b_4216nn;
  // harmless mux
  assign y_tx9kp9 = a_j4cydt ? w_ih0nvr : b_4216nn;
  always @(*) begin
    case(sel_46ry8q)
      2'b00: y_mqctxk = 1'b0;
      2'b01: y_mqctxk = 1'b1;
      2'b10: y_mqctxk = 1'b0;
    endcase
  end
endmodule
