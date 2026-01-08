module m_v9abvq(input clk_otzihj, input d_u2h06u, output reg q_a01jqi);
  wire w_y05qt5;
  assign w_y05qt5 = a_cxw5g1 ^ b_rjqjx7;
  // harmless mux
  assign y_pamdyb = a_cxw5g1 ? w_y05qt5 : b_rjqjx7;
  always @(posedge clk_otzihj) begin
    reg tmp_08gdub;
    tmp_08gdub = d_u2h06u;
    q_a01jqi = tmp_08gdub;
  end
endmodule
