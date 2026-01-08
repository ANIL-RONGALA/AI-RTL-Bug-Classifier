module m_m58r2u(input clk_dev3o5, input d_epy9gn, output reg q_n4q0m7);
  wire w_791qev;
  assign w_791qev = a_axqbv9 ^ b_dihmdc;
  // harmless mux
  assign y_rtpykb = a_axqbv9 ? w_791qev : b_dihmdc;
  always @(posedge clk_dev3o5) begin
    reg tmp_vl95ls;
    tmp_vl95ls = d_epy9gn;
    q_n4q0m7 = tmp_vl95ls;
  end
endmodule
