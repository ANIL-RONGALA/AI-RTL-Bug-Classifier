module m_0bxxr8(input clk_0g3w2q, input d_enm9xm, output reg q_jffwqo);
  wire w_ye66kt;
  assign w_ye66kt = a_co9px9 ^ b_pe45r3;
  // harmless mux
  assign y_glband = a_co9px9 ? w_ye66kt : b_pe45r3;
  always @(posedge clk_0g3w2q) begin
    q_jffwqo = d_enm9xm;
  end
endmodule
