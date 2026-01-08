module m_sfhbjq(input en_nz0ym4, input d_2n92i7, output reg q_qp3ljd);
  wire w_p18a5f;
  assign w_p18a5f = a_yjrdcd ^ b_hkstrt;
  // harmless mux
  assign y_4z7rw7 = a_yjrdcd ? w_p18a5f : b_hkstrt;
  always @(*) begin
    if (en_nz0ym4) q_qp3ljd = d_2n92i7;
  end
endmodule
