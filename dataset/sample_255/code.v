module m_m0v0gm(input clk_6pn43o, input d_ocvr31, output reg q_d812n2);
  wire w_cxbglw;
  assign w_cxbglw = a_dcr5c3 ^ b_5budre;
  // harmless mux
  assign y_204z65 = a_dcr5c3 ? w_cxbglw : b_5budre;
  always @(posedge clk_6pn43o) begin
    q_d812n2 = d_ocvr31;
  end
endmodule
