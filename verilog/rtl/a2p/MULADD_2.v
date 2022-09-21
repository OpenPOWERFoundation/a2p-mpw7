// scala

module MULADD_2 (
  input      [51:0]   src1,
  input      [33:0]   src2,
  output     [65:0]   result
);
  wire       [65:0]   _zz_1_;
  wire       [33:0]   _zz_2_;
  wire       [65:0]   _zz_3_;
  wire       [65:0]   _zz_4_;
  wire       [33:0]   _zz_5_;

  assign _zz_1_ = ($signed(_zz_3_) + $signed(_zz_4_));
  assign _zz_2_ = src2;
  assign _zz_3_ = {{32{_zz_2_[33]}}, _zz_2_};
  assign _zz_4_ = ({32'd0,_zz_5_} <<< 32);
  assign _zz_5_ = src2;
  assign result = _zz_1_;

endmodule