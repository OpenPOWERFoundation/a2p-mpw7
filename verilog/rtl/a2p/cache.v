`include "defs.v"

// n x 4B array
// handle USE_LATCH here (diff components/add ff if needed)

module cache #(
   parameter EXPAND_TYPE=`DATA_RAM_1RW1R,
   parameter ROWS=1024,
   parameter USE_LATCH=0
) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
   input clk,
   input  [9:0]  rd_adr,
   output [31:0] rd_dat,
   input  [3:0]  wr_en,
   input  [9:0]  wr_adr,
   input  [31:0] wr_dat
);

generate case (EXPAND_TYPE)

   `INFERRED: begin
      reg [31:0] mem [0:ROWS-1];
      reg [31:0] dat_q;

      always @ (posedge clk) begin

         dat_q <= mem[rd_adr];      // no bypass
         if(wr_en[0]) begin
            mem[wr_adr][7:0] <= wr_dat[7:0];
         end
         if(wr_en[1]) begin
            mem[wr_adr][15:8] <= wr_dat[15:8];
         end
         if(wr_en[2]) begin
            mem[wr_adr][23:16] <= wr_dat[23:16];
         end
         if(wr_en[3]) begin
            mem[wr_adr][31:24] <= wr_dat[31:24];
         end

      end

      assign rd_dat = USE_LATCH ? dat_q : mem[rd_adr];

   end

   `DATA_RAM: begin
      wire [9:0] adr;
      assign adr = |wr_en ? wr_adr : rd_adr;

      case (ROWS)

         1024: begin
            RAM1024 #() ra (
`ifdef USE_POWER_PINS
               .vccd1(vccd1),	// User area 1 1.8V supply
               .vssd1(vssd1),	// User area 1 digital ground
`endif
               .CLK(clk),
               .EN0('b1),
               .A0(adr),
               .Do0(rd_dat),
               .WE0(wr_en),
               .Di0(wr_dat)
            );
         end

         32,16,8,4: begin
            RAM32 #() ra (
`ifdef USE_POWER_PINS
               .vccd1(vccd1),	// User area 1 1.8V supply
               .vssd1(vssd1),	// User area 1 digital ground
`endif
               .CLK(clk),
               .EN0('b1),
               .A0(adr),
               .Do0(rd_dat),
               .WE0(wr_en),
               .Di0(wr_dat)
            );
         end

      endcase

   end

   // can also do this with 2x RAM32_1RW
   // but need the 'last_write' vector to point to most-recently-written
   // need to ping-pong r/w every time a write occurs
   // really want 1R1W and get rid of extra output port
   `DATA_RAM_1RW1R: begin

      case (ROWS)

         32,16,8,4: begin

            // see if lvs_lef passes...no
            (* keep *) reg [31:0] dummy_q;
            wire [31:0] dummy_d;
            always @(posedge clk)
               dummy_q <= dummy_d;

            RAM32_1RW1R #() ra (
`ifdef USE_POWER_PINS
               .VPWR(vccd1),	// User area 1 1.8V supply
               .VGND(vssd1),	// User area 1 digital ground
`endif
               .CLK(clk),
               .EN0('b1),
               .A0(wr_adr),
               .Do0(dummy_d),
               .WE0(wr_en),
               .Di0(wr_dat),
               .EN1('b1),
               .A1(rd_adr),
               .Do1(rd_dat)
            );
         end

      endcase

   end

   `GPR_2R1W: begin   // 32 rows!!!! write a, read b
      DFFRF_2R1W #() ra (
`ifdef USE_POWER_PINS
         .vccd1(vccd1),	// User area 1 1.8V supply
         .vssd1(vssd1),	// User area 1 digital ground
`endif
         .CLK(clk),
         .RA(rd_adr),
         .DA(rd_dat),
         .RB(0),
         .DB(),
         .RW(wr_adr),
         .WE(wr_en),
         .DW(wr_dat)
      );

   end

endcase
endgenerate

endmodule