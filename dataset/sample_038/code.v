module m_iy9o5v(input en_r5xuv0, input d_gnz2nj, output reg q_sx4wzu);
  wire w_67wtxq;
  assign w_67wtxq = a_5r5f61 ^ b_pik39h;
  // harmless mux
  assign y_5sevw2 = a_5r5f61 ? w_67wtxq : b_pik39h;
  always @(*) begin
    if (en_r5xuv0) q_sx4wzu = d_gnz2nj;
  end
endmodule
