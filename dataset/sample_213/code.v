module m_0rr3fp(input [1:0] sel_qw5lz5, output reg y_npy6ar);
  wire w_e420bk;
  assign w_e420bk = a_76ecfz ^ b_flqod0;
  // harmless mux
  assign y_krvut4 = a_76ecfz ? w_e420bk : b_flqod0;
  always @(*) begin
    case(sel_qw5lz5)
      2'b00: y_npy6ar = 1'b0;
      2'b01: y_npy6ar = 1'b1;
    endcase
  end
endmodule
