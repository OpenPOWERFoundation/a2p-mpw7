// scala

module REG32 (
  output     [31:0]   q,
  input               we,
  input      [31:0]   d,
  input               clk,
  input               reset
);
  reg        [31:0]   reg_1_;

  assign q = reg_1_;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      reg_1_ <= 32'h0;
    end else begin
      if(we)begin
        reg_1_ <= d;
      end
    end
  end

endmodule