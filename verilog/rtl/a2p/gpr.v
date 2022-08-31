`include "defs.v"

module gpr #(
   parameter EXPAND_TYPE=`INFERRED
) (
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
   `GPR_2R1W: begin: rf_2r1w
      /* veeerilator is parsing this when not gen'd */
      DFFRF_2R1W #() rf_0 (
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
      reg_3r1w #() rf (
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
      ram_32x32 #() ra_0 (
         .CLK(clk),
         .EN0('b1),
         .A0(rd_adr_0),
         .Do0(rd_dat_0),
         .WE0(wr_en_0),
         .Di0(wr_dat_0)
      );
      ram_32x32 #() ra_1 (
         .CLK(clk),
         .EN0('b1),
         .A0(rd_adr_1),
         .Do0(rd_dat_1),
         .WE0(wr_en_0),
         .Di0(wr_dat_0)
      );
      ram_32x32 #() ra_2 (
         .CLK(clk),
         .EN0('b1),
         .A0(rd_adr_2),
         .Do0(rd_dat_2),
         .WE0(wr_en_0),
         .Di0(wr_dat_0)
      );
   end

endcase
endgenerate

endmodule