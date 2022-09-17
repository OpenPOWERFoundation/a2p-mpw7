module RAM32_1RW1R (
    VGND,
    VPWR,
    CLK,
    EN0,
    A0,
    Do0,
    WE0,
    Di0,
    EN1,
    A1,
    Do1
 );
 input VGND;
 input VPWR;
 input [4:0] A0;
 input [4:0] A1;
 input CLK;
 input [31:0] Di0;
 output [31:0] Do0;
 output [31:0] Do1;
 input EN0;
 input EN1;
 input [3:0] WE0;
endmodule
