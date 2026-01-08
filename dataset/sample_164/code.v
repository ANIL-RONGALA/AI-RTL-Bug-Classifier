module m_m3rbmj(input clk_lbxx5v, input d_6v62g4, output reg q_h4h8o5);
  wire w_fzxp1i;
  assign w_fzxp1i = a_yn6xvl ^ b_st59rx;
  // harmless mux
  assign y_acaay9 = a_yn6xvl ? w_fzxp1i : b_st59rx;
  always @(posedge clk_lbxx5v) begin
    reg tmp_631xvz;
    tmp_631xvz = d_6v62g4;
    q_h4h8o5 = tmp_631xvz;
  end
endmodule
