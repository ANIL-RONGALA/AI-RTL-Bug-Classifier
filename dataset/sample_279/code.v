module m_xj95xc(input en_4u9dxn, input d_b05vod, output reg q_pdjtwv);
  wire w_ulaw71;
  assign w_ulaw71 = a_bwbeeo ^ b_uqa3gj;
  // harmless mux
  assign y_se0mgs = a_bwbeeo ? w_ulaw71 : b_uqa3gj;
  always @(*) begin
    if (en_4u9dxn) q_pdjtwv = d_b05vod;
    // other path leaves q_pdjtwv unchanged
  end
endmodule
