module m_wn082i(input clk_79xo5f, input d_j1rzss, output reg q_18rojw);
  wire w_8yo7cc;
  assign w_8yo7cc = a_yjfv5h ^ b_ulhyou;
  // harmless mux
  assign y_n2p86a = a_yjfv5h ? w_8yo7cc : b_ulhyou;
  always @(posedge clk_79xo5f) begin
    reg tmp_alyf6l;
    tmp_alyf6l = d_j1rzss;
    q_18rojw = tmp_alyf6l;
  end
endmodule
