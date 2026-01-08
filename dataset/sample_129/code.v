module m_m218re(input en_by8hqr, input d_29iqgz, output reg q_m903ni);
  wire w_0hhdai;
  assign w_0hhdai = a_xrc4cc ^ b_mnkgwj;
  // harmless mux
  assign y_ooxmsg = a_xrc4cc ? w_0hhdai : b_mnkgwj;
  always @(*) begin
    if (en_by8hqr) q_m903ni = d_29iqgz;
  end
endmodule
