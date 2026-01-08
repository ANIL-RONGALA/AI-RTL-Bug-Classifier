module m_rg21to(input [1:0] sel_ger0a6, output reg y_8y9eql);
  wire w_l7bvz4;
  assign w_l7bvz4 = a_f1misp ^ b_no0mzk;
  // harmless mux
  assign y_buviqk = a_f1misp ? w_l7bvz4 : b_no0mzk;
  always @(*) begin
    case(sel_ger0a6)
      2'b00: y_8y9eql = 1'b0;
      2'b01: y_8y9eql = 1'b1;
      2'b10: y_8y9eql = 1'b0;
    endcase
  end
endmodule
