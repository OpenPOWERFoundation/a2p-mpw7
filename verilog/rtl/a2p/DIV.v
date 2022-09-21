// scala

module DIV (
  input      [32:0]   src1,
  input      [31:0]   src2,
  input               start,
  input               div_mod,
  input               revert,
  output     [31:0]   result,
  output              valid,
  output              ov,
  input               clk,
  input               reset
);
  wire                _zz_3_;
  wire                _zz_4_;
  wire       [0:0]    _zz_5_;
  wire       [5:0]    _zz_6_;
  wire       [32:0]   _zz_7_;
  wire       [31:0]   _zz_8_;
  wire       [31:0]   _zz_9_;
  wire       [32:0]   _zz_10_;
  wire       [32:0]   _zz_11_;
  wire       [32:0]   _zz_12_;
  wire       [32:0]   _zz_13_;
  wire       [0:0]    _zz_14_;
  wire       [32:0]   _zz_15_;
  reg        [32:0]   src1_1_;
  reg        [31:0]   src2_1_;
  reg        [64:0]   accumulator;
  reg        [31:0]   result_1_;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [5:0]    counter_valueNext;
  reg        [5:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 running;
  reg                 done;
  reg                 valid_1_;
  reg                 start_regNext;
  wire       [31:0]   _zz_1_;
  wire       [32:0]   DIV_stg_0_remainderShifted;
  wire       [32:0]   DIV_stg_0_remainderMinusDenominator;
  wire       [31:0]   DIV_stg_0_outRemainder;
  wire       [31:0]   DIV_stg_0_outNumerator;
  wire       [31:0]   _zz_2_;

  assign _zz_3_ = (start && (! start_regNext));
  assign _zz_4_ = (running && (! done));
  assign _zz_5_ = counter_willIncrement;
  assign _zz_6_ = {5'd0, _zz_5_};
  assign _zz_7_ = {1'd0, src2_1_};
  assign _zz_8_ = DIV_stg_0_remainderMinusDenominator[31:0];
  assign _zz_9_ = DIV_stg_0_remainderShifted[31:0];
  assign _zz_10_ = {_zz_1_,(! DIV_stg_0_remainderMinusDenominator[32])};
  assign _zz_11_ = _zz_12_;
  assign _zz_12_ = _zz_13_;
  assign _zz_13_ = ({1'b0,(revert ? (~ _zz_2_) : _zz_2_)} + _zz_15_);
  assign _zz_14_ = revert;
  assign _zz_15_ = {32'd0, _zz_14_};
  always @ (*) begin
    counter_willIncrement = 1'b0;
    if(! _zz_3_) begin
      if(_zz_4_)begin
        counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    counter_willClear = 1'b0;
    if(_zz_3_)begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 6'h21);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @ (*) begin
    if(counter_willOverflow)begin
      counter_valueNext = 6'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_6_);
    end
    if(counter_willClear)begin
      counter_valueNext = 6'h0;
    end
  end

  assign valid = valid_1_;
  assign result = result_1_;
  assign ov = (src2_1_ == 32'h0);
  assign _zz_1_ = src1_1_[31 : 0];
  assign DIV_stg_0_remainderShifted = {accumulator[31 : 0],_zz_1_[31]};
  assign DIV_stg_0_remainderMinusDenominator = (DIV_stg_0_remainderShifted - _zz_7_);
  assign DIV_stg_0_outRemainder = ((! DIV_stg_0_remainderMinusDenominator[32]) ? _zz_8_ : _zz_9_);
  assign DIV_stg_0_outNumerator = _zz_10_[31:0];
  assign _zz_2_ = (div_mod ? accumulator[31 : 0] : src1_1_[31 : 0]);
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      counter_value <= 6'h0;
    end else begin
      counter_value <= counter_valueNext;
    end
  end

  always @ (posedge clk) begin
    if((counter_value == 6'h20))begin
      done <= 1'b1;
    end
    start_regNext <= start;
    if(_zz_3_)begin
      src1_1_ <= src1;
      src2_1_ <= src2;
      accumulator <= 65'h0;
      running <= 1'b1;
      done <= 1'b0;
    end else begin
      if(_zz_4_)begin
        src1_1_[31 : 0] <= DIV_stg_0_outNumerator;
        accumulator[31 : 0] <= DIV_stg_0_outRemainder;
        if((counter_value == 6'h20))begin
          result_1_ <= _zz_11_[31:0];
        end
      end else begin
        if(running)begin
          valid_1_ <= 1'b1;
          running <= 1'b0;
        end
      end
    end
  end


endmodule