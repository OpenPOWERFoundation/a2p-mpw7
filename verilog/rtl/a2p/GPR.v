// this is the one straight from scala
// let's see how it gets built as macro

module GPR (
   //inout              vccd1,
   //inout              vssd1,
  input      [4:0]    rd_adr_0,
  output     [31:0]   rd_dat_0,
  input      [4:0]    rd_adr_1,
  output     [31:0]   rd_dat_1,
  input      [4:0]    rd_adr_2,
  output     [31:0]   rd_dat_2,
  input               wr_en_0,
  input      [4:0]    wr_adr_0,
  input      [31:0]   wr_dat_0,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_1_;
  reg        [31:0]   _zz_2_;
  reg        [31:0]   _zz_3_;
  wire                _zz_4_;
  wire                _zz_5_;
  wire                _zz_6_;
  reg [31:0] regFile [0:31] /* verilator public */ ;

  assign _zz_4_ = 1'b1;
  assign _zz_5_ = 1'b1;
  assign _zz_6_ = 1'b1;
  always @ (posedge clk) begin
    if(_zz_4_) begin
      _zz_1_ <= regFile[rd_adr_0];
    end
  end

  always @ (posedge clk) begin
    if(_zz_5_) begin
      _zz_2_ <= regFile[rd_adr_1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      _zz_3_ <= regFile[rd_adr_2];
    end
  end

  always @ (posedge clk) begin
    if(wr_en_0) begin
      regFile[wr_adr_0] <= wr_dat_0;
    end
  end

  assign rd_dat_0 = _zz_1_;
  assign rd_dat_1 = _zz_2_;
  assign rd_dat_2 = _zz_3_;

endmodule