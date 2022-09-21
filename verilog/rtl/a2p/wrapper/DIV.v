module DIV (
  input      [32:0]   src1,
  input      [31:0]   src2,
  input               start,
  input               div_mod,
  input               revert,
  output     [31:0]   result,
  output              valid,
  output              ov,
  input               clk,
  input               reset
);

endmodule