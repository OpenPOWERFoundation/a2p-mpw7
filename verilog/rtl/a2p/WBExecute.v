// scala

module WBExecute (
  input      [31:0]   src0,
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      [31:0]   src3,
  input      [31:0]   src4,
  input      [31:0]   src5,
  input      [31:0]   src6,
  input      [6:0]    sel,
  input      [2:0]    zom,
  output reg [31:0]   result
);
  wire       [31:0]   _zz_1_;
  wire       [31:0]   _zz_2_;
  wire       [31:0]   _zz_3_;
  wire                _zz_4_;
  wire       [31:0]   _zz_5_;
  wire       [31:0]   _zz_6_;
  wire       [31:0]   presel;
  reg        [31:0]   constant_1_;

  assign _zz_1_ = (src0 & (sel[0] ? 32'hffffffff : 32'h0));
  assign _zz_2_ = (src1 & (sel[1] ? 32'hffffffff : 32'h0));
  assign _zz_3_ = (sel[2] ? 32'hffffffff : 32'h0);
  assign _zz_4_ = sel[3];
  assign _zz_5_ = 32'hffffffff;
  assign _zz_6_ = 32'h0;
  assign presel = ((((((_zz_1_ | _zz_2_) | (src2 & _zz_3_)) | (src3 & (_zz_4_ ? _zz_5_ : _zz_6_))) | (src4 & (sel[4] ? 32'hffffffff : 32'h0))) | (src5 & (sel[5] ? 32'hffffffff : 32'h0))) | (src6 & (sel[6] ? 32'hffffffff : 32'h0)));
  always @ (*) begin
    constant_1_ = 32'h0;
    if(zom[2])begin
      constant_1_ = 32'hffffffff;
    end else begin
      if(zom[1])begin
        constant_1_ = 32'h00000001;
      end
    end
  end

  always @ (*) begin
    result = constant_1_;
    if((zom == (3'b000)))begin
      result = presel;
    end
  end


endmodule
