`include "defs.v"

// handle USE_LATCH here (diff components/add ff if needed)

module dir #(
   parameter EXPAND_TYPE=`INFERRED,
   parameter ROWS=128,
   parameter BITS=32,
   parameter USE_LATCH=0
) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
   input             clk,
   input  [6:0]      rd_adr,
   output [BITS-1:0] rd_dat,
   input  [3:0]      wr_en,
   input  [6:0]      wr_adr,
   input  [BITS-1:0] wr_dat
);

generate case (EXPAND_TYPE)

   `INFERRED: begin
      reg [BITS-1:0] mem [0:ROWS-1];
      reg [BITS-1:0] dat_q;

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

   `DIR_RAM: begin
      wire [6:0] adr;
      assign adr = |wr_en ? wr_adr : rd_adr;
      if (ROWS > 32) begin
         RAM128 #() ra (
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
      end else begin
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

   end

endcase
endgenerate

endmodule