module m_w1hcuz(input [1:0] sel_753aw0, output reg y_q43mnh);
  wire w_duwbd5;
  assign w_duwbd5 = a_6ot8zd ^ b_16um7j;
  // harmless mux
  assign y_fps10r = a_6ot8zd ? w_duwbd5 : b_16um7j;
  always @(*) begin
    case(sel_753aw0)
      2'b00: y_q43mnh = 1'b0;
      2'b01: y_q43mnh = 1'b1;
      2'b10: y_q43mnh = 1'b0;
    endcase
  end
endmodule
