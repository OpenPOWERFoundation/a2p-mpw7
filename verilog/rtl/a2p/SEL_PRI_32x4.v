// scala version

module SEL_PRI_32x4 (
  input      [31:0]   src0,
  input      [31:0]   src1,
  input      [31:0]   src2,
  input      [31:0]   src3,
  input      [3:0]    sel,
  output reg [31:0]   result
);

  always @ (*) begin
    if(sel[0])begin
      result = src0;
    end else begin
      if(sel[1])begin
        result = src1;
      end else begin
        if(sel[2])begin
          result = src2;
        end else begin
          if(sel[3])begin
            result = src3;
          end else begin
            result = 32'h0;
          end
        end
      end
    end
  end


endmodule