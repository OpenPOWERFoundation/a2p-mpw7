`timescale 1 ps / 1 ps

// 32x32 dual port
module RAM32_1RW1R (CLK, EN0, A0, Do0, WE0, Di0, EN1, A1, Do1);

   parameter data_w = 32;
   parameter addr_w = 5;
   parameter USE_LATCH = 0;

   input                CLK;
   input                EN0;
   input  [addr_w-1:0]  A0;
   output [data_w-1:0]  Do0;
   input  [3:0]         WE0;
   input  [data_w-1:0]  Di0;
   input                EN1;
   input  [addr_w-1:0]  A1;
   output [data_w-1:0]  Do1;

   reg    [data_w-1:0]  mem[2**addr_w-1:0];
   reg    [data_w-1:0]  Do0_q;
   reg    [data_w-1:0]  Do1_q;

   initial begin: init
      integer i;
      for (i = 0; i < 2**addr_w; i = i + 1)
         mem[i] = 0;
   end

   always @(posedge CLK) begin
      if (EN0) begin
         Do0_q <= mem[A0];
         Do1_q <= mem[A1];
         if (WE0[0]) begin
            mem[A0][7:0] <= Di0[7:0];
         end
         if (WE0[1]) begin
            mem[A0][15:8] <= Di0[15:8];
         end
         if (WE0[2]) begin
            mem[A0][23:16] <= Di0[23:16];
         end
         if (WE0[3]) begin
            mem[A0][31:24] <= Di0[31:24];
         end
      end
   end

   assign Do0 = USE_LATCH ? Do0_q : mem[A0];
   assign Do1 = USE_LATCH ? Do1_q : mem[A1];

endmodule
