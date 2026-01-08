module m_dwfiya(input clk_q0r53m, input d_ew394a, output reg q_jlt9bg);
  wire w_a60odv;
  assign w_a60odv = a_nxclvx ^ b_v20rw2;
  // harmless mux
  assign y_wqbwc7 = a_nxclvx ? w_a60odv : b_v20rw2;
  always @(posedge clk_q0r53m) begin
    reg tmp_pr122s;
    tmp_pr122s = d_ew394a;
    q_jlt9bg = tmp_pr122s;
  end
endmodule
