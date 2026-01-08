module m_kbdbjn(input en_blq0w2, input d_l0ziuh, output reg q_vmvl1j);
  wire w_kw55t6;
  assign w_kw55t6 = a_xya59r ^ b_d1thk6;
  // harmless mux
  assign y_mg1j9q = a_xya59r ? w_kw55t6 : b_d1thk6;
  always @(*) begin
    if (en_blq0w2) q_vmvl1j = d_l0ziuh;
    // other path leaves q_vmvl1j unchanged
  end
endmodule
