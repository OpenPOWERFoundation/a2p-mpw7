`include "defs.v"

module gpr #(
   parameter EXPAND_TYPE=`INFERRED,
   parameter USE_LATCH=0
) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
   input clk,
   input   [4:0] rd_adr_0,
   output [31:0] rd_dat_0,
   input   [4:0] rd_adr_1,
   output [31:0] rd_dat_1,
   input   [4:0] rd_adr_2,
   output [31:0] rd_dat_2,
   input         wr_en_0,
   input   [4:0] wr_adr_0,
   input  [31:0] wr_dat_0
);

generate case (EXPAND_TYPE)

   `INFERRED: begin
      reg [31:0] regFile [0:31] /* verilator public */ ;
      assign rd_dat_0 = regFile[rd_adr_0];
      assign rd_dat_1 = regFile[rd_adr_1];
      assign rd_dat_2 = regFile[rd_adr_2];
      always @ (posedge clk) begin
         if(wr_en_0) begin
            regFile[wr_adr_0] <= wr_dat_0;
         end
      end
   end
   `GPR_2R1W: begin
      /* veeerilator is parsing this when not gen'd */
      DFFRF_2R1W #() rf_0 (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .RA(rd_adr_0),
         .DA(rd_dat_0),
         .RB(rd_adr_1),
         .DB(rd_dat_1),
         .RW(wr_adr_0),
         .WE(wr_en_0),
         .DW(wr_dat_0)
      );
      // should this be a ram_32x32?  any other diffs between reg/ram besides multiple we vs extra port?
      DFFRF_2R1W #() rf_1 (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .RA(rd_adr_2),
         .DA(rd_dat_2),
         .RB('h0),
         .DB(),
         .RW(wr_adr_0),
         .WE(wr_en_0),
         .DW(wr_dat_0)
      );
   end
   `GPR_3R1W: begin
      DFFRF_3R1W #() rf (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .RA(rd_adr_0),
         .DA(rd_dat_0),
         .RB(rd_adr_1),
         .DB(rd_dat_1),
         .RC(rd_adr_2),
         .DC(rd_dat_2),
         .RW(wr_adr_0),
         .WE(wr_en_0),
         .DW(wr_dat_0)
      );
   end
   `GPR_RAM: begin
      RAM32_1RW1R #() ra_0 (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .EN0('b1),
         .A0(wr_adr_0),
         .Do0(),
         .WE0(wr_en_0),
         .Di0(wr_dat_0),
         .EN1('b1),
         .A1(rd_adr_0),
         .Do1(rd_dat_0)
      );
      RAM32_1RW1R #() ra_1 (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .EN0('b1),
         .A0(wr_adr_0),
         .Do0(),
         .WE0(wr_en_0),
         .Di0(wr_dat_0),
         .EN1('b1),
         .A1(rd_adr_1),
         .Do1(rd_dat_1)
      );
      RAM32_1RW1R #() ra_2 (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .EN0('b1),
         .A0(wr_adr_0),
         .Do0(),
         .WE0(wr_en_0),
         .Di0(wr_dat_0),
         .EN1('b1),
         .A1(rd_adr_2),
         .Do1(rd_dat_2)
      );
   end

endcase
endgenerate

endmodule