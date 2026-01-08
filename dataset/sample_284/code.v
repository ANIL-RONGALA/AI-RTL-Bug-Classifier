module m_hsrn4s(input [1:0] sel_dc0jbw, output reg y_g3tseh);
  wire w_by9jwx;
  assign w_by9jwx = a_rscjmv ^ b_vai36h;
  // harmless mux
  assign y_n4u5hw = a_rscjmv ? w_by9jwx : b_vai36h;
  always @(*) begin
    case(sel_dc0jbw)
      2'b00: y_g3tseh = 1'b0;
      2'b01: y_g3tseh = 1'b1;
      2'b10: y_g3tseh = 1'b0;
    endcase
  end
endmodule
