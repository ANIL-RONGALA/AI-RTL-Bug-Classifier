module m_zlymai(input clk_xf0d7c, input d_62xzjl, output reg q_3aiwu1);
  wire w_ki1vun;
  assign w_ki1vun = a_ucstmy ^ b_dnx7um;
  // harmless mux
  assign y_uxei09 = a_ucstmy ? w_ki1vun : b_dnx7um;
  always @(posedge clk_xf0d7c) begin
    q_3aiwu1 = d_62xzjl;
  end
endmodule
