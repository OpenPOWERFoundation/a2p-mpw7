// 32x32_3R1W Behavioral

module DFFRF_3R1W (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif
    input            CLK,
    input  [4:0]     RA, RB, RC, RW,
    output [31:0]    DA, DB, DC,
    input            WE,
    input  [31:0]    DW
);

endmodule
