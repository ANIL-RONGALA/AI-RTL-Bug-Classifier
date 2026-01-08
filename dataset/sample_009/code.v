module m_1ihhma(input clk_d2mkrk, input d_96dgtu, output reg q_0r11ee);
  wire w_p95dc6;
  assign w_p95dc6 = a_njk2vd ^ b_hpubei;
  // harmless mux
  assign y_l0n6n1 = a_njk2vd ? w_p95dc6 : b_hpubei;
  always @(posedge clk_d2mkrk) begin
    q_0r11ee = d_96dgtu;
  end
endmodule
