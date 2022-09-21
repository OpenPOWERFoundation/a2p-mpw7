// scala version

module SEL_32x3 (
  input      [31:0]   src0,
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      [2:0]    sel,
  output     [31:0]   result
);

  assign result = (((src0 & (sel[0] ? 32'hffffffff : 32'h0)) | (src1 & (sel[1] ? 32'hffffffff : 32'h0))) | (src2 & (sel[2] ? 32'hffffffff : 32'h0)));

endmodule