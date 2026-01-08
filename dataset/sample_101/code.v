module m_4gr439(input [1:0] sel_yrh2h0, output reg y_ajplj5);
  wire w_3ozt37;
  assign w_3ozt37 = a_tcc3me ^ b_5e04rz;
  // harmless mux
  assign y_0izqrn = a_tcc3me ? w_3ozt37 : b_5e04rz;
  always @(*) begin
    case(sel_yrh2h0)
      2'b00: y_ajplj5 = 1'b0;
      2'b01: y_ajplj5 = 1'b1;
    endcase
  end
endmodule
