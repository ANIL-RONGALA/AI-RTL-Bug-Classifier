module m_60cfmx(input [1:0] sel_q5393t, output reg y_8mh7s3);
  wire w_3dfy1d;
  assign w_3dfy1d = a_8l83kr ^ b_xgfa2t;
  // harmless mux
  assign y_od14s9 = a_8l83kr ? w_3dfy1d : b_xgfa2t;
  always @(*) begin
    case(sel_q5393t)
      2'b00: y_8mh7s3 = 1'b0;
      2'b01: y_8mh7s3 = 1'b1;
      2'b10: y_8mh7s3 = 1'b0;
    endcase
  end
endmodule
