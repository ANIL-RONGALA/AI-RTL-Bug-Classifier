module m_pg9ri5(input clk_2p4wt3, input d_vd038r, output reg q_o4oc0z);
  wire w_yglmky;
  assign w_yglmky = a_hfldaa ^ b_z7ocst;
  // harmless mux
  assign y_y3eh55 = a_hfldaa ? w_yglmky : b_z7ocst;
  always @(posedge clk_2p4wt3) begin
    q_o4oc0z = d_vd038r;
  end
endmodule
