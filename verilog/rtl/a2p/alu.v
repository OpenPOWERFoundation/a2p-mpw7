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
  wire       [32:0]   _zz_1_;
  wire       [32:0]   _zz_2_;
  wire       [31:0]   _zz_3_;
  wire       [31:0]   _zz_4_;
  wire       [32:0]   adder;
  wire       [31:0]   ra;
  wire       [31:0]   rb;
  wire       [0:0]    cin_1_;

  assign _zz_1_ = ({(1'b0),ra} + {(1'b0),rb});
  assign _zz_2_ = {32'd0, cin_1_};
  assign _zz_3_ = ra;
  assign _zz_4_ = rb;
  assign ra = src1;
  assign rb = src2;
  assign cin_1_ = cin;
  assign adder = (_zz_1_ + _zz_2_);
  assign result = adder[31 : 0];
  assign add_cr = {adder[31],(adder[31 : 0] == 32'h0)};
  assign cmpl_cr = {(ra < rb),(ra == rb)};
  assign cmp_cr = {($signed(_zz_3_) < $signed(_zz_4_)),(ra == rb)};
  assign ca = adder[32];
  assign ov = ((adder[32] ^ adder[31]) && (! (ra[31] ^ rb[31])));

endmodule
