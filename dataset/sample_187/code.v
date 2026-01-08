module m_f74og6(input [1:0] sel_vc2ioq, output reg y_umdhu2);
  wire w_25yg0p;
  assign w_25yg0p = a_ssllfb ^ b_e565cq;
  // harmless mux
  assign y_7a81o1 = a_ssllfb ? w_25yg0p : b_e565cq;
  always @(*) begin
    case(sel_vc2ioq)
      2'b00: y_umdhu2 = 1'b0;
      2'b01: y_umdhu2 = 1'b1;
    endcase
  end
endmodule
