module m_0l0ew5(input clk_54nubt, input d_kwp83k, output reg q_mth13d);
  wire w_fjijxz;
  assign w_fjijxz = a_76em78 ^ b_vcohen;
  // harmless mux
  assign y_a9s568 = a_76em78 ? w_fjijxz : b_vcohen;
  always @(posedge clk_54nubt) begin
    q_mth13d = d_kwp83k;
  end
endmodule
