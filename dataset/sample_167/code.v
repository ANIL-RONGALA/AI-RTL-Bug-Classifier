module m_s3tne6(input clk_pepj3x, input d_qy5dph, output reg q_4rbpsl);
  wire w_7514gn;
  assign w_7514gn = a_v4vs3q ^ b_5u0gdc;
  // harmless mux
  assign y_rbxw20 = a_v4vs3q ? w_7514gn : b_5u0gdc;
  always @(posedge clk_pepj3x) begin
    reg tmp_aaicla;
    tmp_aaicla = d_qy5dph;
    q_4rbpsl = tmp_aaicla;
  end
endmodule
