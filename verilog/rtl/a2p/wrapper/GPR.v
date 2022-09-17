module GPR (
   inout              vccd1,
   inout              vssd1,
  input      [4:0]    rd_adr_0,
  output     [31:0]   rd_dat_0,
  input      [4:0]    rd_adr_1,
  output     [31:0]   rd_dat_1,
  input      [4:0]    rd_adr_2,
  output     [31:0]   rd_dat_2,
  input               wr_en_0,
  input      [4:0]    wr_adr_0,
  input      [31:0]   wr_dat_0,
  input               clk,
  input               reset
);

endmodule