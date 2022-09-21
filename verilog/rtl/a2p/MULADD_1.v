// scala

module MULADD_1 (
  input      [32:0]   src1,
  input      [49:0]   src2,
  input      [49:0]   src3,
  output     [51:0]   result
);
  wire       [51:0]   _zz_1_;
  wire       [51:0]   _zz_2_;
  wire       [51:0]   _zz_3_;
  wire       [51:0]   _zz_4_;
  wire       [33:0]   _zz_5_;
  wire       [51:0]   _zz_6_;
  wire       [49:0]   _zz_7_;
  wire       [51:0]   _zz_8_;
  wire       [49:0]   _zz_9_;
  wire       [51:0]   _zz_10_;

  assign _zz_1_ = ($signed(_zz_2_) + $signed(_zz_10_));
  assign _zz_2_ = ($signed(_zz_3_) + $signed(_zz_8_));
  assign _zz_3_ = ($signed(_zz_4_) + $signed(_zz_6_));
  assign _zz_4_ = 52'h0;
  assign _zz_5_ = {1'b0,src1};
  assign _zz_6_ = {{18{_zz_5_[33]}}, _zz_5_};
  assign _zz_7_ = src2;
  assign _zz_8_ = {{2{_zz_7_[49]}}, _zz_7_};
  assign _zz_9_ = src3;
  assign _zz_10_ = {{2{_zz_9_[49]}}, _zz_9_};
  assign result = _zz_1_;

endmodule