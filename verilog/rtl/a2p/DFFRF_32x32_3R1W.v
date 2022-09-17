// 32x32_3R1W Behavioral

module DFFRF_32x32_3R1W (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif
    input            CLK,
    input  [4:0]     R1, R2, R3, RW,
    output [31:0]    D1, D2, D3,
    input            WE,
    input  [31:0]    DW
);

    reg [31:0] ra[0:31];

    assign D1 = ra[R1];
    assign D2 = ra[R2];
    assign D3 = ra[R3];

    always @(posedge CLK) begin
      if (WE)
         ra[RW] <= DW;
    end

endmodule
