module m_wz63md(input clk_l4rpfx, input d_g433yi, output reg q_k96b1y);
  wire w_luc7su;
  assign w_luc7su = a_kcrkkq ^ b_e72clx;
  // harmless mux
  assign y_zt3pet = a_kcrkkq ? w_luc7su : b_e72clx;
  always @(posedge clk_l4rpfx) begin
    q_k96b1y = d_g433yi;
  end
endmodule
