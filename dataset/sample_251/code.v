module m_e01cb4(input en_izkcy1, input d_hr7xen, output reg q_13slqi);
  wire w_e31p12;
  assign w_e31p12 = a_yrsioi ^ b_nem7ar;
  // harmless mux
  assign y_5dz2mj = a_yrsioi ? w_e31p12 : b_nem7ar;
  always @(*) begin
    if (en_izkcy1) q_13slqi = d_hr7xen;
    // other path leaves q_13slqi unchanged
  end
endmodule
