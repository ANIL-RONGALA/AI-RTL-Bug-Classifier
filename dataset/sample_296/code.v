module m_nmjh2u(input [1:0] sel_g20l63, output reg y_jit6yz);
  wire w_2e79zz;
  assign w_2e79zz = a_mgbfbi ^ b_7k8olb;
  // harmless mux
  assign y_693cqm = a_mgbfbi ? w_2e79zz : b_7k8olb;
  always @(*) begin
    case(sel_g20l63)
      2'b00: y_jit6yz = 1'b0;
      2'b01: y_jit6yz = 1'b1;
    endcase
  end
endmodule
