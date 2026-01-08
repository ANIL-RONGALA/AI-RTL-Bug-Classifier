module m_d3iu2x(input clk_dbdssw, input d_0lhf38, output reg q_u35f9c);
  wire w_124hwn;
  assign w_124hwn = a_1r7y36 ^ b_bjkyoy;
  // harmless mux
  assign y_p6a7lb = a_1r7y36 ? w_124hwn : b_bjkyoy;
  always @(posedge clk_dbdssw) begin
    reg tmp_f1jexx;
    tmp_f1jexx = d_0lhf38;
    q_u35f9c = tmp_f1jexx;
  end
endmodule
