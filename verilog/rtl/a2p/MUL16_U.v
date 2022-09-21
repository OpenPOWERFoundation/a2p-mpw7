// scala

module MUL16_U (
  input      [15:0]   src1,
  input      [15:0]   src2,
  output     [31:0]   result
);
  wire       [31:0]   _zz_1_;

  assign _zz_1_ = (src1 * src2);
  assign result = _zz_1_;

endmodule