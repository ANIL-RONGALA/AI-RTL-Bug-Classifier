module m_8dw6eg(input clk_gcpmh8, input d_yfl8eo, output reg q_k6vw52);
  wire w_w862fg;
  assign w_w862fg = a_hrw6t8 ^ b_462wcs;
  // harmless mux
  assign y_evrpm0 = a_hrw6t8 ? w_w862fg : b_462wcs;
  always @(posedge clk_gcpmh8) begin
    reg tmp_oevwjs;
    tmp_oevwjs = d_yfl8eo;
    q_k6vw52 = tmp_oevwjs;
  end
endmodule
