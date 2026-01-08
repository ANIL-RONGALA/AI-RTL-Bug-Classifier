module m_7o1o6v(input clk_ymw7he, input d_uztvua, output reg q_mukv7n);
  wire w_sm761d;
  assign w_sm761d = a_uoqe2e ^ b_4s5sn7;
  // harmless mux
  assign y_p6m65d = a_uoqe2e ? w_sm761d : b_4s5sn7;
  always @(posedge clk_ymw7he) begin
    reg tmp_a08dy3;
    tmp_a08dy3 = d_uztvua;
    q_mukv7n = tmp_a08dy3;
  end
endmodule
