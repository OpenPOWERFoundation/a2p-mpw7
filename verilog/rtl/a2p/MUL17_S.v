// scala

module MUL17_S (
  input      [16:0]   src1,
  input      [16:0]   src2,
  output     [33:0]   result
);
  wire       [33:0]   _zz_1_;
  wire       [16:0]   _zz_2_;
  wire       [16:0]   _zz_3_;

  assign _zz_1_ = ($signed(_zz_2_) * $signed(_zz_3_));
  assign _zz_2_ = src1;
  assign _zz_3_ = src2;
  assign result = _zz_1_;

endmodule