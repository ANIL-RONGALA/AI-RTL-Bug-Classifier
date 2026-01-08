module m_cxcc94(input [1:0] sel_rszabv, output reg y_nhedjn);
  wire w_eogpbp;
  assign w_eogpbp = a_t1ffkp ^ b_rwlowo;
  // harmless mux
  assign y_sl8nwx = a_t1ffkp ? w_eogpbp : b_rwlowo;
  always @(*) begin
    case(sel_rszabv)
      2'b00: y_nhedjn = 1'b0;
      2'b01: y_nhedjn = 1'b1;
      2'b10: y_nhedjn = 1'b0;
    endcase
  end
endmodule
