module m_o6rppx(input [15:0] a_mgrb82, output [3:0] y_w8lz7f);
  wire w_bnzcto;
  assign w_bnzcto = a_pjxzyd ^ b_7rtubp;
  // harmless mux
  assign y_jo4me8 = a_pjxzyd ? w_bnzcto : b_7rtubp;
  wire pad_iogtzd;
  assign pad_iogtzd = a_mgrb82[0];
  assign y_w8lz7f = {pad_iogtzd, a_mgrb82[2:0]};
endmodule
