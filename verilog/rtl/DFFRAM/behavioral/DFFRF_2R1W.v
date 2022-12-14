`timescale 1 ps / 1 ps

module DFFRF_2R1W (CLK, RA, DA, RB, DB, RW, WE, DW);

   parameter data_w = 32;
   parameter addr_w = 5;
   parameter USE_LATCH = 0;

   input                CLK;
   input  [addr_w-1:0]  RA;
   output [data_w-1:0]  DA;
   input  [addr_w-1:0]  RB;
   output [data_w-1:0]  DB;
   input                WE;
   input  [addr_w-1:0]  RW;
   input  [data_w-1:0]  DW;

   reg    [data_w-1:0]  mem[2**addr_w-1:0];
   reg    [data_w-1:0]  DA_q;
   reg    [data_w-1:0]  DB_q;

   initial begin: init
      integer i;
      for (i = 0; i < 2**addr_w; i = i + 1)
         mem[i] = 0;
   end

   always @(posedge CLK) begin
      DA_q <= mem[RA];
      DB_q <= mem[RB];
      if (WE) begin
         mem[RW] <= DW;
      end
   end

   assign DA = USE_LATCH ? DA_q : mem[RA];
   assign DB = USE_LATCH ? DB_q : mem[RB];

endmodule
