`define SYNTHESIS

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD 2'b00
`define AluCtrlEnum_defaultEncoding_BIT_1 2'b01
`define AluCtrlEnum_defaultEncoding_RIMI 2'b10
`define AluCtrlEnum_defaultEncoding_SPEC 2'b11

`define AluRimiCtrlEnum_defaultEncoding_type [2:0]
`define AluRimiCtrlEnum_defaultEncoding_ROT 3'b000
`define AluRimiCtrlEnum_defaultEncoding_INS 3'b001
`define AluRimiCtrlEnum_defaultEncoding_SHIFTL 3'b010
`define AluRimiCtrlEnum_defaultEncoding_SHIFTR 3'b011
`define AluRimiCtrlEnum_defaultEncoding_SHIFTRA 3'b100

`define AluSpecCtrlEnum_defaultEncoding_type [2:0]
`define AluSpecCtrlEnum_defaultEncoding_CNTLZW 3'b000
`define AluSpecCtrlEnum_defaultEncoding_CNTTZW 3'b001
`define AluSpecCtrlEnum_defaultEncoding_POPCNTB 3'b010
`define AluSpecCtrlEnum_defaultEncoding_POPCNTW 3'b011
`define AluSpecCtrlEnum_defaultEncoding_CMPB 3'b100
`define AluSpecCtrlEnum_defaultEncoding_PRTYW 3'b101

`define AluBitwiseCtrlEnum_defaultEncoding_type [3:0]
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 4'b0000
`define AluBitwiseCtrlEnum_defaultEncoding_ANDC 4'b0001
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 4'b0010
`define AluBitwiseCtrlEnum_defaultEncoding_ORC 4'b0011
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 4'b0100
`define AluBitwiseCtrlEnum_defaultEncoding_XORC 4'b0101
`define AluBitwiseCtrlEnum_defaultEncoding_EQV 4'b0110
`define AluBitwiseCtrlEnum_defaultEncoding_NAND_1 4'b0111
`define AluBitwiseCtrlEnum_defaultEncoding_NOR_1 4'b1000
`define AluBitwiseCtrlEnum_defaultEncoding_EXTSB 4'b1001
`define AluBitwiseCtrlEnum_defaultEncoding_EXTSH 4'b1010

module ALUL (
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      `AluCtrlEnum_defaultEncoding_type alu_ctrl,
  input      `AluBitwiseCtrlEnum_defaultEncoding_type bit_ctrl,
  input      `AluRimiCtrlEnum_defaultEncoding_type rimi_ctrl,
  input      `AluSpecCtrlEnum_defaultEncoding_type spec_ctrl,
  input      [4:0]    shift_amt,
  input      [4:0]    mask_mb,
  input      [4:0]    mask_me,
  output     [31:0]   result,
  output     [2:0]    cr,
  output              xer_ca,
  output              xer_ov
);
  wire       [31:0]   _zz_31_;
  wire       [31:0]   _zz_32_;
  wire       [31:0]   _zz_33_;
  wire       [31:0]   _zz_34_;
  wire       [31:0]   _zz_35_;
  wire       [31:0]   _zz_36_;
  wire       [31:0]   _zz_37_;
  wire       [5:0]    _zz_38_;
  wire       [5:0]    _zz_39_;
  reg        [5:0]    _zz_1_;
  reg        [5:0]    _zz_1__30;
  reg        [5:0]    _zz_1__29;
  reg        [5:0]    _zz_1__28;
  reg        [5:0]    _zz_1__27;
  reg        [5:0]    _zz_1__26;
  reg        [5:0]    _zz_1__25;
  reg        [5:0]    _zz_1__24;
  reg        [5:0]    _zz_1__23;
  reg        [5:0]    _zz_1__22;
  reg        [5:0]    _zz_1__21;
  reg        [5:0]    _zz_1__20;
  reg        [5:0]    _zz_1__19;
  reg        [5:0]    _zz_1__18;
  reg        [5:0]    _zz_1__17;
  reg        [5:0]    _zz_1__16;
  reg        [5:0]    _zz_1__15;
  reg        [5:0]    _zz_1__14;
  reg        [5:0]    _zz_1__13;
  reg        [5:0]    _zz_1__12;
  reg        [5:0]    _zz_1__11;
  reg        [5:0]    _zz_1__10;
  reg        [5:0]    _zz_1__9;
  reg        [5:0]    _zz_1__8;
  reg        [5:0]    _zz_1__7;
  reg        [5:0]    _zz_1__6;
  reg        [5:0]    _zz_1__5;
  reg        [5:0]    _zz_1__4;
  reg        [5:0]    _zz_1__3;
  reg        [5:0]    _zz_1__2;
  reg        [5:0]    _zz_1__1;
  reg        [5:0]    _zz_1__0;
  reg        [3:0]    _zz_2_;
  reg        [3:0]    _zz_2__6;
  reg        [3:0]    _zz_2__5;
  reg        [3:0]    _zz_2__4;
  reg        [3:0]    _zz_2__3;
  reg        [3:0]    _zz_2__2;
  reg        [3:0]    _zz_2__1;
  reg        [3:0]    _zz_2__0;
  reg        [3:0]    _zz_3_;
  reg        [3:0]    _zz_3__6;
  reg        [3:0]    _zz_3__5;
  reg        [3:0]    _zz_3__4;
  reg        [3:0]    _zz_3__3;
  reg        [3:0]    _zz_3__2;
  reg        [3:0]    _zz_3__1;
  reg        [3:0]    _zz_3__0;
  reg        [3:0]    _zz_4_;
  reg        [3:0]    _zz_4__6;
  reg        [3:0]    _zz_4__5;
  reg        [3:0]    _zz_4__4;
  reg        [3:0]    _zz_4__3;
  reg        [3:0]    _zz_4__2;
  reg        [3:0]    _zz_4__1;
  reg        [3:0]    _zz_4__0;
  reg        [3:0]    _zz_5_;
  reg        [3:0]    _zz_5__6;
  reg        [3:0]    _zz_5__5;
  reg        [3:0]    _zz_5__4;
  reg        [3:0]    _zz_5__3;
  reg        [3:0]    _zz_5__2;
  reg        [3:0]    _zz_5__1;
  reg        [3:0]    _zz_5__0;
  reg        [31:0]   _zz_6_;
  reg        [31:0]   _zz_7_;
  reg        [31:0]   _zz_8_;
  reg        [31:0]   _zz_9_;
  reg        [31:0]   _zz_10_;
  reg        [31:0]   _zz_11_;
  reg        [31:0]   _zz_12_;
  reg        [31:0]   _zz_13_;
  reg        [31:0]   _zz_14_;
  reg        [31:0]   _zz_15_;
  wire                _zz_16_;
  reg        [23:0]   _zz_17_;
  wire                _zz_18_;
  reg        [15:0]   _zz_19_;
  reg        [31:0]   bitwise;
  reg        [1:0]    bitwise_enc_cr;
  reg        [2:0]    bitwise_cr;
  reg        [31:0]   mask;
  reg        [31:0]   maskNorm;
  reg        [31:0]   maskInvt;
  wire       [31:0]   rimi;
  wire       [31:0]   _zz_20_;
  wire       [31:0]   _zz_21_;
  reg        [31:0]   _zz_22_;
  reg                 sraw_ca;
  wire       [31:0]   sraw_wtf;
  reg        [1:0]    rimi_enc_cr;
  reg        [2:0]    rimi_cr;
  reg        [5:0]    cntzero_lz;
  reg        [31:0]   _zz_23_;
  reg        [5:0]    cntzero_msb;
  reg        [5:0]    cntzero_tz;
  reg        [5:0]    cntzero_lsb;
  wire       [3:0]    popcnt_pb0;
  wire       [3:0]    popcnt_pb1;
  wire       [3:0]    popcnt_pb2;
  wire       [3:0]    popcnt_pb3;
  wire       [7:0]    _zz_24_;
  wire       [7:0]    _zz_25_;
  wire       [7:0]    _zz_26_;
  wire       [7:0]    _zz_27_;
  wire       [5:0]    popcnt_pw0;
  wire       [31:0]   _zz_28_;
  reg        [31:0]   popcnt_cmpb;
  wire                popcnt_prtyw;
  reg        [31:0]   spec;
  reg        [31:0]   _zz_29_;
  reg        [2:0]    _zz_30_;
  `ifndef SYNTHESIS
  reg [39:0] alu_ctrl_string;
  reg [47:0] bit_ctrl_string;
  reg [55:0] rimi_ctrl_string;
  reg [55:0] spec_ctrl_string;
  `endif


  assign _zz_31_ = (src1 <<< shift_amt);
  assign _zz_32_ = (src1 >>> shift_amt);
  assign _zz_33_ = _zz_34_;
  assign _zz_34_ = ($signed(_zz_35_) >>> shift_amt);
  assign _zz_35_ = src1;
  assign _zz_36_ = 32'hffffffff;
  assign _zz_37_ = _zz_36_;
  assign _zz_38_ = (6'h20 - _zz_39_);
  assign _zz_39_ = {1'd0, shift_amt};
  `ifndef SYNTHESIS
  always @(*) begin
    case(alu_ctrl)
      `AluCtrlEnum_defaultEncoding_ADD : alu_ctrl_string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : alu_ctrl_string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : alu_ctrl_string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : alu_ctrl_string = "SPEC ";
      default : alu_ctrl_string = "?????";
    endcase
  end
  always @(*) begin
    case(bit_ctrl)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : bit_ctrl_string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : bit_ctrl_string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : bit_ctrl_string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : bit_ctrl_string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : bit_ctrl_string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : bit_ctrl_string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : bit_ctrl_string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : bit_ctrl_string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : bit_ctrl_string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : bit_ctrl_string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : bit_ctrl_string = "EXTSH ";
      default : bit_ctrl_string = "??????";
    endcase
  end
  always @(*) begin
    case(rimi_ctrl)
      `AluRimiCtrlEnum_defaultEncoding_ROT : rimi_ctrl_string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : rimi_ctrl_string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : rimi_ctrl_string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : rimi_ctrl_string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : rimi_ctrl_string = "SHIFTRA";
      default : rimi_ctrl_string = "???????";
    endcase
  end
  always @(*) begin
    case(spec_ctrl)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : spec_ctrl_string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : spec_ctrl_string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : spec_ctrl_string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : spec_ctrl_string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : spec_ctrl_string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : spec_ctrl_string = "PRTYW  ";
      default : spec_ctrl_string = "???????";
    endcase
  end
  `endif

  always @ (*) begin
    _zz_1_ = _zz_1__30;
    if(_zz_28_[31])begin
      _zz_1_ = (_zz_1__30 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__30 = _zz_1__29;
    if(_zz_28_[30])begin
      _zz_1__30 = (_zz_1__29 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__29 = _zz_1__28;
    if(_zz_28_[29])begin
      _zz_1__29 = (_zz_1__28 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__28 = _zz_1__27;
    if(_zz_28_[28])begin
      _zz_1__28 = (_zz_1__27 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__27 = _zz_1__26;
    if(_zz_28_[27])begin
      _zz_1__27 = (_zz_1__26 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__26 = _zz_1__25;
    if(_zz_28_[26])begin
      _zz_1__26 = (_zz_1__25 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__25 = _zz_1__24;
    if(_zz_28_[25])begin
      _zz_1__25 = (_zz_1__24 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__24 = _zz_1__23;
    if(_zz_28_[24])begin
      _zz_1__24 = (_zz_1__23 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__23 = _zz_1__22;
    if(_zz_28_[23])begin
      _zz_1__23 = (_zz_1__22 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__22 = _zz_1__21;
    if(_zz_28_[22])begin
      _zz_1__22 = (_zz_1__21 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__21 = _zz_1__20;
    if(_zz_28_[21])begin
      _zz_1__21 = (_zz_1__20 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__20 = _zz_1__19;
    if(_zz_28_[20])begin
      _zz_1__20 = (_zz_1__19 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__19 = _zz_1__18;
    if(_zz_28_[19])begin
      _zz_1__19 = (_zz_1__18 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__18 = _zz_1__17;
    if(_zz_28_[18])begin
      _zz_1__18 = (_zz_1__17 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__17 = _zz_1__16;
    if(_zz_28_[17])begin
      _zz_1__17 = (_zz_1__16 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__16 = _zz_1__15;
    if(_zz_28_[16])begin
      _zz_1__16 = (_zz_1__15 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__15 = _zz_1__14;
    if(_zz_28_[15])begin
      _zz_1__15 = (_zz_1__14 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__14 = _zz_1__13;
    if(_zz_28_[14])begin
      _zz_1__14 = (_zz_1__13 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__13 = _zz_1__12;
    if(_zz_28_[13])begin
      _zz_1__13 = (_zz_1__12 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__12 = _zz_1__11;
    if(_zz_28_[12])begin
      _zz_1__12 = (_zz_1__11 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__11 = _zz_1__10;
    if(_zz_28_[11])begin
      _zz_1__11 = (_zz_1__10 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__10 = _zz_1__9;
    if(_zz_28_[10])begin
      _zz_1__10 = (_zz_1__9 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__9 = _zz_1__8;
    if(_zz_28_[9])begin
      _zz_1__9 = (_zz_1__8 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__8 = _zz_1__7;
    if(_zz_28_[8])begin
      _zz_1__8 = (_zz_1__7 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__7 = _zz_1__6;
    if(_zz_28_[7])begin
      _zz_1__7 = (_zz_1__6 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__6 = _zz_1__5;
    if(_zz_28_[6])begin
      _zz_1__6 = (_zz_1__5 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__5 = _zz_1__4;
    if(_zz_28_[5])begin
      _zz_1__5 = (_zz_1__4 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__4 = _zz_1__3;
    if(_zz_28_[4])begin
      _zz_1__4 = (_zz_1__3 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__3 = _zz_1__2;
    if(_zz_28_[3])begin
      _zz_1__3 = (_zz_1__2 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__2 = _zz_1__1;
    if(_zz_28_[2])begin
      _zz_1__2 = (_zz_1__1 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__1 = _zz_1__0;
    if(_zz_28_[1])begin
      _zz_1__1 = (_zz_1__0 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_1__0 = 6'h0;
    if(_zz_28_[0])begin
      _zz_1__0 = (6'h0 + 6'h01);
    end
  end

  always @ (*) begin
    _zz_2_ = _zz_2__6;
    if(_zz_27_[7])begin
      _zz_2_ = (_zz_2__6 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__6 = _zz_2__5;
    if(_zz_27_[6])begin
      _zz_2__6 = (_zz_2__5 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__5 = _zz_2__4;
    if(_zz_27_[5])begin
      _zz_2__5 = (_zz_2__4 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__4 = _zz_2__3;
    if(_zz_27_[4])begin
      _zz_2__4 = (_zz_2__3 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__3 = _zz_2__2;
    if(_zz_27_[3])begin
      _zz_2__3 = (_zz_2__2 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__2 = _zz_2__1;
    if(_zz_27_[2])begin
      _zz_2__2 = (_zz_2__1 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__1 = _zz_2__0;
    if(_zz_27_[1])begin
      _zz_2__1 = (_zz_2__0 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_2__0 = (4'b0000);
    if(_zz_27_[0])begin
      _zz_2__0 = ((4'b0000) + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3_ = _zz_3__6;
    if(_zz_26_[7])begin
      _zz_3_ = (_zz_3__6 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__6 = _zz_3__5;
    if(_zz_26_[6])begin
      _zz_3__6 = (_zz_3__5 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__5 = _zz_3__4;
    if(_zz_26_[5])begin
      _zz_3__5 = (_zz_3__4 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__4 = _zz_3__3;
    if(_zz_26_[4])begin
      _zz_3__4 = (_zz_3__3 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__3 = _zz_3__2;
    if(_zz_26_[3])begin
      _zz_3__3 = (_zz_3__2 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__2 = _zz_3__1;
    if(_zz_26_[2])begin
      _zz_3__2 = (_zz_3__1 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__1 = _zz_3__0;
    if(_zz_26_[1])begin
      _zz_3__1 = (_zz_3__0 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_3__0 = (4'b0000);
    if(_zz_26_[0])begin
      _zz_3__0 = ((4'b0000) + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4_ = _zz_4__6;
    if(_zz_25_[7])begin
      _zz_4_ = (_zz_4__6 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__6 = _zz_4__5;
    if(_zz_25_[6])begin
      _zz_4__6 = (_zz_4__5 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__5 = _zz_4__4;
    if(_zz_25_[5])begin
      _zz_4__5 = (_zz_4__4 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__4 = _zz_4__3;
    if(_zz_25_[4])begin
      _zz_4__4 = (_zz_4__3 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__3 = _zz_4__2;
    if(_zz_25_[3])begin
      _zz_4__3 = (_zz_4__2 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__2 = _zz_4__1;
    if(_zz_25_[2])begin
      _zz_4__2 = (_zz_4__1 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__1 = _zz_4__0;
    if(_zz_25_[1])begin
      _zz_4__1 = (_zz_4__0 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_4__0 = (4'b0000);
    if(_zz_25_[0])begin
      _zz_4__0 = ((4'b0000) + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5_ = _zz_5__6;
    if(_zz_24_[7])begin
      _zz_5_ = (_zz_5__6 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__6 = _zz_5__5;
    if(_zz_24_[6])begin
      _zz_5__6 = (_zz_5__5 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__5 = _zz_5__4;
    if(_zz_24_[5])begin
      _zz_5__5 = (_zz_5__4 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__4 = _zz_5__3;
    if(_zz_24_[4])begin
      _zz_5__4 = (_zz_5__3 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__3 = _zz_5__2;
    if(_zz_24_[3])begin
      _zz_5__3 = (_zz_5__2 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__2 = _zz_5__1;
    if(_zz_24_[2])begin
      _zz_5__2 = (_zz_5__1 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__1 = _zz_5__0;
    if(_zz_24_[1])begin
      _zz_5__1 = (_zz_5__0 + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_5__0 = (4'b0000);
    if(_zz_24_[0])begin
      _zz_5__0 = ((4'b0000) + (4'b0001));
    end
  end

  always @ (*) begin
    _zz_6_ = _zz_7_;
    _zz_6_ = (shift_amt[4] ? {_zz_7_[15 : 0],_zz_7_[31 : 16]} : _zz_7_);
  end

  always @ (*) begin
    _zz_7_ = _zz_8_;
    _zz_7_ = (shift_amt[3] ? {_zz_8_[23 : 0],_zz_8_[31 : 24]} : _zz_8_);
  end

  always @ (*) begin
    _zz_8_ = _zz_9_;
    _zz_8_ = (shift_amt[2] ? {_zz_9_[27 : 0],_zz_9_[31 : 28]} : _zz_9_);
  end

  always @ (*) begin
    _zz_9_ = _zz_10_;
    _zz_9_ = (shift_amt[1] ? {_zz_10_[29 : 0],_zz_10_[31 : 30]} : _zz_10_);
  end

  always @ (*) begin
    _zz_10_ = _zz_21_;
    _zz_10_ = (shift_amt[0] ? {_zz_21_[30 : 0],_zz_21_[31 : 31]} : _zz_21_);
  end

  always @ (*) begin
    _zz_11_ = _zz_12_;
    _zz_11_ = (shift_amt[4] ? {_zz_12_[15 : 0],_zz_12_[31 : 16]} : _zz_12_);
  end

  always @ (*) begin
    _zz_12_ = _zz_13_;
    _zz_12_ = (shift_amt[3] ? {_zz_13_[23 : 0],_zz_13_[31 : 24]} : _zz_13_);
  end

  always @ (*) begin
    _zz_13_ = _zz_14_;
    _zz_13_ = (shift_amt[2] ? {_zz_14_[27 : 0],_zz_14_[31 : 28]} : _zz_14_);
  end

  always @ (*) begin
    _zz_14_ = _zz_15_;
    _zz_14_ = (shift_amt[1] ? {_zz_15_[29 : 0],_zz_15_[31 : 30]} : _zz_15_);
  end

  always @ (*) begin
    _zz_15_ = _zz_20_;
    _zz_15_ = (shift_amt[0] ? {_zz_20_[30 : 0],_zz_20_[31 : 31]} : _zz_20_);
  end

  assign _zz_16_ = src1[7];
  always @ (*) begin
    _zz_17_[23] = _zz_16_;
    _zz_17_[22] = _zz_16_;
    _zz_17_[21] = _zz_16_;
    _zz_17_[20] = _zz_16_;
    _zz_17_[19] = _zz_16_;
    _zz_17_[18] = _zz_16_;
    _zz_17_[17] = _zz_16_;
    _zz_17_[16] = _zz_16_;
    _zz_17_[15] = _zz_16_;
    _zz_17_[14] = _zz_16_;
    _zz_17_[13] = _zz_16_;
    _zz_17_[12] = _zz_16_;
    _zz_17_[11] = _zz_16_;
    _zz_17_[10] = _zz_16_;
    _zz_17_[9] = _zz_16_;
    _zz_17_[8] = _zz_16_;
    _zz_17_[7] = _zz_16_;
    _zz_17_[6] = _zz_16_;
    _zz_17_[5] = _zz_16_;
    _zz_17_[4] = _zz_16_;
    _zz_17_[3] = _zz_16_;
    _zz_17_[2] = _zz_16_;
    _zz_17_[1] = _zz_16_;
    _zz_17_[0] = _zz_16_;
  end

  assign _zz_18_ = src1[15];
  always @ (*) begin
    _zz_19_[15] = _zz_18_;
    _zz_19_[14] = _zz_18_;
    _zz_19_[13] = _zz_18_;
    _zz_19_[12] = _zz_18_;
    _zz_19_[11] = _zz_18_;
    _zz_19_[10] = _zz_18_;
    _zz_19_[9] = _zz_18_;
    _zz_19_[8] = _zz_18_;
    _zz_19_[7] = _zz_18_;
    _zz_19_[6] = _zz_18_;
    _zz_19_[5] = _zz_18_;
    _zz_19_[4] = _zz_18_;
    _zz_19_[3] = _zz_18_;
    _zz_19_[2] = _zz_18_;
    _zz_19_[1] = _zz_18_;
    _zz_19_[0] = _zz_18_;
  end

  always @ (*) begin
    case(bit_ctrl)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        bitwise = (src1 & src2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : begin
        bitwise = (src1 & (~ src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        bitwise = (src1 | src2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : begin
        bitwise = (src1 | (~ src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : begin
        bitwise = (src1 ^ src2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : begin
        bitwise = (src1 ^ (~ src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : begin
        bitwise = (~ (src1 & src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : begin
        bitwise = (~ (src1 | src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : begin
        bitwise = (~ (src1 ^ src2));
      end
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : begin
        bitwise = {_zz_17_,src1[7 : 0]};
      end
      default : begin
        bitwise = {_zz_19_,src1[15 : 0]};
      end
    endcase
  end

  always @ (*) begin
    bitwise_enc_cr[1] = bitwise[31];
    bitwise_enc_cr[0] = (bitwise == 32'h0);
  end

  always @ (*) begin
    case(bitwise_enc_cr)
      2'b00 : begin
        bitwise_cr = (3'b010);
      end
      2'b01 : begin
        bitwise_cr = (3'b001);
      end
      default : begin
        bitwise_cr = (3'b100);
      end
    endcase
  end

  always @ (*) begin
    maskNorm[0] = 1'b0;
    if(((mask_mb <= 5'h1f) && (5'h1f <= mask_me)))begin
      maskNorm[0] = 1'b1;
    end
    maskNorm[1] = 1'b0;
    if(((mask_mb <= 5'h1e) && (5'h1e <= mask_me)))begin
      maskNorm[1] = 1'b1;
    end
    maskNorm[2] = 1'b0;
    if(((mask_mb <= 5'h1d) && (5'h1d <= mask_me)))begin
      maskNorm[2] = 1'b1;
    end
    maskNorm[3] = 1'b0;
    if(((mask_mb <= 5'h1c) && (5'h1c <= mask_me)))begin
      maskNorm[3] = 1'b1;
    end
    maskNorm[4] = 1'b0;
    if(((mask_mb <= 5'h1b) && (5'h1b <= mask_me)))begin
      maskNorm[4] = 1'b1;
    end
    maskNorm[5] = 1'b0;
    if(((mask_mb <= 5'h1a) && (5'h1a <= mask_me)))begin
      maskNorm[5] = 1'b1;
    end
    maskNorm[6] = 1'b0;
    if(((mask_mb <= 5'h19) && (5'h19 <= mask_me)))begin
      maskNorm[6] = 1'b1;
    end
    maskNorm[7] = 1'b0;
    if(((mask_mb <= 5'h18) && (5'h18 <= mask_me)))begin
      maskNorm[7] = 1'b1;
    end
    maskNorm[8] = 1'b0;
    if(((mask_mb <= 5'h17) && (5'h17 <= mask_me)))begin
      maskNorm[8] = 1'b1;
    end
    maskNorm[9] = 1'b0;
    if(((mask_mb <= 5'h16) && (5'h16 <= mask_me)))begin
      maskNorm[9] = 1'b1;
    end
    maskNorm[10] = 1'b0;
    if(((mask_mb <= 5'h15) && (5'h15 <= mask_me)))begin
      maskNorm[10] = 1'b1;
    end
    maskNorm[11] = 1'b0;
    if(((mask_mb <= 5'h14) && (5'h14 <= mask_me)))begin
      maskNorm[11] = 1'b1;
    end
    maskNorm[12] = 1'b0;
    if(((mask_mb <= 5'h13) && (5'h13 <= mask_me)))begin
      maskNorm[12] = 1'b1;
    end
    maskNorm[13] = 1'b0;
    if(((mask_mb <= 5'h12) && (5'h12 <= mask_me)))begin
      maskNorm[13] = 1'b1;
    end
    maskNorm[14] = 1'b0;
    if(((mask_mb <= 5'h11) && (5'h11 <= mask_me)))begin
      maskNorm[14] = 1'b1;
    end
    maskNorm[15] = 1'b0;
    if(((mask_mb <= 5'h10) && (5'h10 <= mask_me)))begin
      maskNorm[15] = 1'b1;
    end
    maskNorm[16] = 1'b0;
    if(((mask_mb <= 5'h0f) && (5'h0f <= mask_me)))begin
      maskNorm[16] = 1'b1;
    end
    maskNorm[17] = 1'b0;
    if(((mask_mb <= 5'h0e) && (5'h0e <= mask_me)))begin
      maskNorm[17] = 1'b1;
    end
    maskNorm[18] = 1'b0;
    if(((mask_mb <= 5'h0d) && (5'h0d <= mask_me)))begin
      maskNorm[18] = 1'b1;
    end
    maskNorm[19] = 1'b0;
    if(((mask_mb <= 5'h0c) && (5'h0c <= mask_me)))begin
      maskNorm[19] = 1'b1;
    end
    maskNorm[20] = 1'b0;
    if(((mask_mb <= 5'h0b) && (5'h0b <= mask_me)))begin
      maskNorm[20] = 1'b1;
    end
    maskNorm[21] = 1'b0;
    if(((mask_mb <= 5'h0a) && (5'h0a <= mask_me)))begin
      maskNorm[21] = 1'b1;
    end
    maskNorm[22] = 1'b0;
    if(((mask_mb <= 5'h09) && (5'h09 <= mask_me)))begin
      maskNorm[22] = 1'b1;
    end
    maskNorm[23] = 1'b0;
    if(((mask_mb <= 5'h08) && (5'h08 <= mask_me)))begin
      maskNorm[23] = 1'b1;
    end
    maskNorm[24] = 1'b0;
    if(((mask_mb <= 5'h07) && (5'h07 <= mask_me)))begin
      maskNorm[24] = 1'b1;
    end
    maskNorm[25] = 1'b0;
    if(((mask_mb <= 5'h06) && (5'h06 <= mask_me)))begin
      maskNorm[25] = 1'b1;
    end
    maskNorm[26] = 1'b0;
    if(((mask_mb <= 5'h05) && (5'h05 <= mask_me)))begin
      maskNorm[26] = 1'b1;
    end
    maskNorm[27] = 1'b0;
    if(((mask_mb <= 5'h04) && (5'h04 <= mask_me)))begin
      maskNorm[27] = 1'b1;
    end
    maskNorm[28] = 1'b0;
    if(((mask_mb <= 5'h03) && (5'h03 <= mask_me)))begin
      maskNorm[28] = 1'b1;
    end
    maskNorm[29] = 1'b0;
    if(((mask_mb <= 5'h02) && (5'h02 <= mask_me)))begin
      maskNorm[29] = 1'b1;
    end
    maskNorm[30] = 1'b0;
    if(((mask_mb <= 5'h01) && (5'h01 <= mask_me)))begin
      maskNorm[30] = 1'b1;
    end
    maskNorm[31] = 1'b0;
    if(((mask_mb <= 5'h0) && (5'h0 <= mask_me)))begin
      maskNorm[31] = 1'b1;
    end
  end

  always @ (*) begin
    maskInvt[0] = 1'b0;
    if(((5'h1f <= mask_me) || (mask_mb <= 5'h1f)))begin
      maskInvt[0] = 1'b1;
    end
    maskInvt[1] = 1'b0;
    if(((5'h1e <= mask_me) || (mask_mb <= 5'h1e)))begin
      maskInvt[1] = 1'b1;
    end
    maskInvt[2] = 1'b0;
    if(((5'h1d <= mask_me) || (mask_mb <= 5'h1d)))begin
      maskInvt[2] = 1'b1;
    end
    maskInvt[3] = 1'b0;
    if(((5'h1c <= mask_me) || (mask_mb <= 5'h1c)))begin
      maskInvt[3] = 1'b1;
    end
    maskInvt[4] = 1'b0;
    if(((5'h1b <= mask_me) || (mask_mb <= 5'h1b)))begin
      maskInvt[4] = 1'b1;
    end
    maskInvt[5] = 1'b0;
    if(((5'h1a <= mask_me) || (mask_mb <= 5'h1a)))begin
      maskInvt[5] = 1'b1;
    end
    maskInvt[6] = 1'b0;
    if(((5'h19 <= mask_me) || (mask_mb <= 5'h19)))begin
      maskInvt[6] = 1'b1;
    end
    maskInvt[7] = 1'b0;
    if(((5'h18 <= mask_me) || (mask_mb <= 5'h18)))begin
      maskInvt[7] = 1'b1;
    end
    maskInvt[8] = 1'b0;
    if(((5'h17 <= mask_me) || (mask_mb <= 5'h17)))begin
      maskInvt[8] = 1'b1;
    end
    maskInvt[9] = 1'b0;
    if(((5'h16 <= mask_me) || (mask_mb <= 5'h16)))begin
      maskInvt[9] = 1'b1;
    end
    maskInvt[10] = 1'b0;
    if(((5'h15 <= mask_me) || (mask_mb <= 5'h15)))begin
      maskInvt[10] = 1'b1;
    end
    maskInvt[11] = 1'b0;
    if(((5'h14 <= mask_me) || (mask_mb <= 5'h14)))begin
      maskInvt[11] = 1'b1;
    end
    maskInvt[12] = 1'b0;
    if(((5'h13 <= mask_me) || (mask_mb <= 5'h13)))begin
      maskInvt[12] = 1'b1;
    end
    maskInvt[13] = 1'b0;
    if(((5'h12 <= mask_me) || (mask_mb <= 5'h12)))begin
      maskInvt[13] = 1'b1;
    end
    maskInvt[14] = 1'b0;
    if(((5'h11 <= mask_me) || (mask_mb <= 5'h11)))begin
      maskInvt[14] = 1'b1;
    end
    maskInvt[15] = 1'b0;
    if(((5'h10 <= mask_me) || (mask_mb <= 5'h10)))begin
      maskInvt[15] = 1'b1;
    end
    maskInvt[16] = 1'b0;
    if(((5'h0f <= mask_me) || (mask_mb <= 5'h0f)))begin
      maskInvt[16] = 1'b1;
    end
    maskInvt[17] = 1'b0;
    if(((5'h0e <= mask_me) || (mask_mb <= 5'h0e)))begin
      maskInvt[17] = 1'b1;
    end
    maskInvt[18] = 1'b0;
    if(((5'h0d <= mask_me) || (mask_mb <= 5'h0d)))begin
      maskInvt[18] = 1'b1;
    end
    maskInvt[19] = 1'b0;
    if(((5'h0c <= mask_me) || (mask_mb <= 5'h0c)))begin
      maskInvt[19] = 1'b1;
    end
    maskInvt[20] = 1'b0;
    if(((5'h0b <= mask_me) || (mask_mb <= 5'h0b)))begin
      maskInvt[20] = 1'b1;
    end
    maskInvt[21] = 1'b0;
    if(((5'h0a <= mask_me) || (mask_mb <= 5'h0a)))begin
      maskInvt[21] = 1'b1;
    end
    maskInvt[22] = 1'b0;
    if(((5'h09 <= mask_me) || (mask_mb <= 5'h09)))begin
      maskInvt[22] = 1'b1;
    end
    maskInvt[23] = 1'b0;
    if(((5'h08 <= mask_me) || (mask_mb <= 5'h08)))begin
      maskInvt[23] = 1'b1;
    end
    maskInvt[24] = 1'b0;
    if(((5'h07 <= mask_me) || (mask_mb <= 5'h07)))begin
      maskInvt[24] = 1'b1;
    end
    maskInvt[25] = 1'b0;
    if(((5'h06 <= mask_me) || (mask_mb <= 5'h06)))begin
      maskInvt[25] = 1'b1;
    end
    maskInvt[26] = 1'b0;
    if(((5'h05 <= mask_me) || (mask_mb <= 5'h05)))begin
      maskInvt[26] = 1'b1;
    end
    maskInvt[27] = 1'b0;
    if(((5'h04 <= mask_me) || (mask_mb <= 5'h04)))begin
      maskInvt[27] = 1'b1;
    end
    maskInvt[28] = 1'b0;
    if(((5'h03 <= mask_me) || (mask_mb <= 5'h03)))begin
      maskInvt[28] = 1'b1;
    end
    maskInvt[29] = 1'b0;
    if(((5'h02 <= mask_me) || (mask_mb <= 5'h02)))begin
      maskInvt[29] = 1'b1;
    end
    maskInvt[30] = 1'b0;
    if(((5'h01 <= mask_me) || (mask_mb <= 5'h01)))begin
      maskInvt[30] = 1'b1;
    end
    maskInvt[31] = 1'b0;
    if(((5'h0 <= mask_me) || (mask_mb <= 5'h0)))begin
      maskInvt[31] = 1'b1;
    end
  end

  always @ (*) begin
    if((mask_mb <= mask_me))begin
      mask = maskNorm;
    end else begin
      mask = maskInvt;
    end
  end

  assign _zz_20_ = src1;
  assign _zz_21_ = src1;
  always @ (*) begin
    case(rimi_ctrl)
      `AluRimiCtrlEnum_defaultEncoding_ROT : begin
        _zz_22_ = (_zz_11_ & mask);
      end
      `AluRimiCtrlEnum_defaultEncoding_INS : begin
        _zz_22_ = ((_zz_6_ & mask) | (src2 & (~ mask)));
      end
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : begin
        _zz_22_ = _zz_31_[31 : 0];
      end
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : begin
        _zz_22_ = _zz_32_[31 : 0];
      end
      default : begin
        _zz_22_ = _zz_33_[31 : 0];
      end
    endcase
  end

  assign rimi = _zz_22_;
  always @ (*) begin
    sraw_ca = 1'b0;
    if((shift_amt != 5'h0))begin
      sraw_ca = (src1[31] && ((sraw_wtf & src1) != 32'h0));
    end
  end

  assign sraw_wtf = (_zz_37_ >>> _zz_38_);
  always @ (*) begin
    rimi_enc_cr[1] = rimi[31];
    rimi_enc_cr[0] = (rimi == 32'h0);
  end

  always @ (*) begin
    case(rimi_enc_cr)
      2'b00 : begin
        rimi_cr = (3'b010);
      end
      2'b01 : begin
        rimi_cr = (3'b001);
      end
      default : begin
        rimi_cr = (3'b100);
      end
    endcase
  end

  always @ (*) begin
    _zz_23_[0] = src1[31];
    _zz_23_[1] = src1[30];
    _zz_23_[2] = src1[29];
    _zz_23_[3] = src1[28];
    _zz_23_[4] = src1[27];
    _zz_23_[5] = src1[26];
    _zz_23_[6] = src1[25];
    _zz_23_[7] = src1[24];
    _zz_23_[8] = src1[23];
    _zz_23_[9] = src1[22];
    _zz_23_[10] = src1[21];
    _zz_23_[11] = src1[20];
    _zz_23_[12] = src1[19];
    _zz_23_[13] = src1[18];
    _zz_23_[14] = src1[17];
    _zz_23_[15] = src1[16];
    _zz_23_[16] = src1[15];
    _zz_23_[17] = src1[14];
    _zz_23_[18] = src1[13];
    _zz_23_[19] = src1[12];
    _zz_23_[20] = src1[11];
    _zz_23_[21] = src1[10];
    _zz_23_[22] = src1[9];
    _zz_23_[23] = src1[8];
    _zz_23_[24] = src1[7];
    _zz_23_[25] = src1[6];
    _zz_23_[26] = src1[5];
    _zz_23_[27] = src1[4];
    _zz_23_[28] = src1[3];
    _zz_23_[29] = src1[2];
    _zz_23_[30] = src1[1];
    _zz_23_[31] = src1[0];
  end

  always @ (*) begin
    cntzero_msb = 6'h0;
    if(_zz_23_[31])begin
      cntzero_msb = 6'h1f;
    end
    if(_zz_23_[30])begin
      cntzero_msb = 6'h1e;
    end
    if(_zz_23_[29])begin
      cntzero_msb = 6'h1d;
    end
    if(_zz_23_[28])begin
      cntzero_msb = 6'h1c;
    end
    if(_zz_23_[27])begin
      cntzero_msb = 6'h1b;
    end
    if(_zz_23_[26])begin
      cntzero_msb = 6'h1a;
    end
    if(_zz_23_[25])begin
      cntzero_msb = 6'h19;
    end
    if(_zz_23_[24])begin
      cntzero_msb = 6'h18;
    end
    if(_zz_23_[23])begin
      cntzero_msb = 6'h17;
    end
    if(_zz_23_[22])begin
      cntzero_msb = 6'h16;
    end
    if(_zz_23_[21])begin
      cntzero_msb = 6'h15;
    end
    if(_zz_23_[20])begin
      cntzero_msb = 6'h14;
    end
    if(_zz_23_[19])begin
      cntzero_msb = 6'h13;
    end
    if(_zz_23_[18])begin
      cntzero_msb = 6'h12;
    end
    if(_zz_23_[17])begin
      cntzero_msb = 6'h11;
    end
    if(_zz_23_[16])begin
      cntzero_msb = 6'h10;
    end
    if(_zz_23_[15])begin
      cntzero_msb = 6'h0f;
    end
    if(_zz_23_[14])begin
      cntzero_msb = 6'h0e;
    end
    if(_zz_23_[13])begin
      cntzero_msb = 6'h0d;
    end
    if(_zz_23_[12])begin
      cntzero_msb = 6'h0c;
    end
    if(_zz_23_[11])begin
      cntzero_msb = 6'h0b;
    end
    if(_zz_23_[10])begin
      cntzero_msb = 6'h0a;
    end
    if(_zz_23_[9])begin
      cntzero_msb = 6'h09;
    end
    if(_zz_23_[8])begin
      cntzero_msb = 6'h08;
    end
    if(_zz_23_[7])begin
      cntzero_msb = 6'h07;
    end
    if(_zz_23_[6])begin
      cntzero_msb = 6'h06;
    end
    if(_zz_23_[5])begin
      cntzero_msb = 6'h05;
    end
    if(_zz_23_[4])begin
      cntzero_msb = 6'h04;
    end
    if(_zz_23_[3])begin
      cntzero_msb = 6'h03;
    end
    if(_zz_23_[2])begin
      cntzero_msb = 6'h02;
    end
    if(_zz_23_[1])begin
      cntzero_msb = 6'h01;
    end
    if(_zz_23_[0])begin
      cntzero_msb = 6'h0;
    end
  end

  always @ (*) begin
    if((cntzero_msb == 6'h0))begin
      if(src1[31])begin
        cntzero_lz = 6'h0;
      end else begin
        cntzero_lz = 6'h20;
      end
    end else begin
      cntzero_lz = cntzero_msb;
    end
  end

  always @ (*) begin
    cntzero_lsb = 6'h0;
    if(src1[31])begin
      cntzero_lsb = 6'h1f;
    end
    if(src1[30])begin
      cntzero_lsb = 6'h1e;
    end
    if(src1[29])begin
      cntzero_lsb = 6'h1d;
    end
    if(src1[28])begin
      cntzero_lsb = 6'h1c;
    end
    if(src1[27])begin
      cntzero_lsb = 6'h1b;
    end
    if(src1[26])begin
      cntzero_lsb = 6'h1a;
    end
    if(src1[25])begin
      cntzero_lsb = 6'h19;
    end
    if(src1[24])begin
      cntzero_lsb = 6'h18;
    end
    if(src1[23])begin
      cntzero_lsb = 6'h17;
    end
    if(src1[22])begin
      cntzero_lsb = 6'h16;
    end
    if(src1[21])begin
      cntzero_lsb = 6'h15;
    end
    if(src1[20])begin
      cntzero_lsb = 6'h14;
    end
    if(src1[19])begin
      cntzero_lsb = 6'h13;
    end
    if(src1[18])begin
      cntzero_lsb = 6'h12;
    end
    if(src1[17])begin
      cntzero_lsb = 6'h11;
    end
    if(src1[16])begin
      cntzero_lsb = 6'h10;
    end
    if(src1[15])begin
      cntzero_lsb = 6'h0f;
    end
    if(src1[14])begin
      cntzero_lsb = 6'h0e;
    end
    if(src1[13])begin
      cntzero_lsb = 6'h0d;
    end
    if(src1[12])begin
      cntzero_lsb = 6'h0c;
    end
    if(src1[11])begin
      cntzero_lsb = 6'h0b;
    end
    if(src1[10])begin
      cntzero_lsb = 6'h0a;
    end
    if(src1[9])begin
      cntzero_lsb = 6'h09;
    end
    if(src1[8])begin
      cntzero_lsb = 6'h08;
    end
    if(src1[7])begin
      cntzero_lsb = 6'h07;
    end
    if(src1[6])begin
      cntzero_lsb = 6'h06;
    end
    if(src1[5])begin
      cntzero_lsb = 6'h05;
    end
    if(src1[4])begin
      cntzero_lsb = 6'h04;
    end
    if(src1[3])begin
      cntzero_lsb = 6'h03;
    end
    if(src1[2])begin
      cntzero_lsb = 6'h02;
    end
    if(src1[1])begin
      cntzero_lsb = 6'h01;
    end
    if(src1[0])begin
      cntzero_lsb = 6'h0;
    end
  end

  always @ (*) begin
    if((cntzero_lsb == 6'h0))begin
      if(src1[0])begin
        cntzero_tz = 6'h0;
      end else begin
        cntzero_tz = 6'h20;
      end
    end else begin
      cntzero_tz = cntzero_lsb;
    end
  end

  assign _zz_24_ = src1[31 : 24];
  assign popcnt_pb3 = _zz_5_;
  assign _zz_25_ = src1[23 : 16];
  assign popcnt_pb2 = _zz_4_;
  assign _zz_26_ = src1[15 : 8];
  assign popcnt_pb1 = _zz_3_;
  assign _zz_27_ = src1[7 : 0];
  assign popcnt_pb0 = _zz_2_;
  assign _zz_28_ = src1[31 : 0];
  assign popcnt_pw0 = _zz_1_;
  always @ (*) begin
    if((src1[31 : 24] == src2[31 : 24]))begin
      popcnt_cmpb[31 : 24] = 8'hff;
    end else begin
      popcnt_cmpb[31 : 24] = 8'h0;
    end
    if((src1[23 : 16] == src2[23 : 16]))begin
      popcnt_cmpb[23 : 16] = 8'hff;
    end else begin
      popcnt_cmpb[23 : 16] = 8'h0;
    end
    if((src1[15 : 8] == src2[15 : 8]))begin
      popcnt_cmpb[15 : 8] = 8'hff;
    end else begin
      popcnt_cmpb[15 : 8] = 8'h0;
    end
    if((src1[7 : 0] == src2[7 : 0]))begin
      popcnt_cmpb[7 : 0] = 8'hff;
    end else begin
      popcnt_cmpb[7 : 0] = 8'h0;
    end
  end

  assign popcnt_prtyw = (((src1[24] ^ src1[16]) ^ src1[8]) ^ src1[0]);
  always @ (*) begin
    case(spec_ctrl)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : begin
        spec = {26'h0,cntzero_lz};
      end
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : begin
        spec = {26'h0,cntzero_tz};
      end
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : begin
        spec = {{{{{{{(4'b0000),popcnt_pb3},(4'b0000)},popcnt_pb2},(4'b0000)},popcnt_pb1},(4'b0000)},popcnt_pb0};
      end
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : begin
        spec = {26'h0,popcnt_pw0};
      end
      `AluSpecCtrlEnum_defaultEncoding_CMPB : begin
        spec = popcnt_cmpb;
      end
      default : begin
        spec = {31'h0,popcnt_prtyw};
      end
    endcase
  end

  always @ (*) begin
    case(alu_ctrl)
      `AluCtrlEnum_defaultEncoding_BIT_1 : begin
        _zz_29_ = bitwise;
      end
      `AluCtrlEnum_defaultEncoding_RIMI : begin
        _zz_29_ = rimi;
      end
      `AluCtrlEnum_defaultEncoding_SPEC : begin
        _zz_29_ = spec;
      end
      default : begin
        _zz_29_ = 32'h0;
      end
    endcase
  end

  assign result = _zz_29_;
  always @ (*) begin
    case(alu_ctrl)
      `AluCtrlEnum_defaultEncoding_BIT_1 : begin
        _zz_30_ = bitwise_cr;
      end
      `AluCtrlEnum_defaultEncoding_RIMI : begin
        _zz_30_ = rimi_cr;
      end
      `AluCtrlEnum_defaultEncoding_SPEC : begin
        _zz_30_ = (3'b000);
      end
      default : begin
        _zz_30_ = (3'b000);
      end
    endcase
  end

  assign cr = _zz_30_;
  assign xer_ca = sraw_ca;
  assign xer_ov = 1'b0;

endmodule

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