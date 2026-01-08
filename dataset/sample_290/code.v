module m_xbso3b(input en_40dknj, input d_bvki77, output reg q_56q1jd);
  wire w_cju0ai;
  assign w_cju0ai = a_f827mx ^ b_vy5i6n;
  // harmless mux
  assign y_knewhr = a_f827mx ? w_cju0ai : b_vy5i6n;
  always @(*) begin
    if (en_40dknj) q_56q1jd = d_bvki77;
  end
endmodule
