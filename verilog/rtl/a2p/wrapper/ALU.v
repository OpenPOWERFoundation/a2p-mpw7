module ALU (
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      [0:0]    cin,
  output     [31:0]   result,
  output     [1:0]    add_cr,
  output     [1:0]    cmp_cr,
  output     [1:0]    cmpl_cr,
  output              ca,
  output              ov
);
endmodule