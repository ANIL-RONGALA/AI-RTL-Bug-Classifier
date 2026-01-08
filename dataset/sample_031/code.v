module m_70w6a9(input clk_l655ok, input d_786pua, output reg q_5hupx5);
  wire w_12utrx;
  assign w_12utrx = a_7rfftz ^ b_4ip23s;
  // harmless mux
  assign y_qfmmyx = a_7rfftz ? w_12utrx : b_4ip23s;
  always @(posedge clk_l655ok) begin
    reg tmp_irhpj0;
    tmp_irhpj0 = d_786pua;
    q_5hupx5 = tmp_irhpj0;
  end
endmodule
