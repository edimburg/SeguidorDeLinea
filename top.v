
`include "CompUnsigned.v"
`include "divFreq.v"
`include "DIG_D_FF_1bit.v"
//`include "divFreq.v"


module top (
  input clk,
  //input dutyb3,
  //input dutyb2,
  //input dutyb1,
 // input dutyb0,
  input wire DL, DI, DD,
  output pwmmd,
 // output wire s9,       para mostrar contador
 // output wire s3,			para mostrar contador
 // output wire s0,			para mostrar contador
 // output wire s1			para mostrar contador
    output wire m1r, m1d,
    output wire m2r, m2d,
    output pwmmi
);
  wire clk_out;
divFreq freq_div (
    .CLK_IN(clk),
    .CLK_OUT(clk_out)
);


  reg dutyb3 = 1'b1;
  reg dutyb2 = 1'b1;
  reg dutyb1 = 1'b0;
  reg dutyb0 = 1'b1;
  
  wire DL_inv, DI_inv, DD_inv;
  //reg clk;
  wire s0;			//contador
  wire s1;			//contador
  wire s2;
  wire s3;			//contador
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;			//contador
  wire s10;
  wire s11;
  wire s12;
  wire s13;
  wire s14;
  wire s15;
  wire s16;
  wire s17;
  CompUnsigned #(
    .Bits(1)
  )
  CompUnsigned_i0 (
    .a( s1 ),
    .b( dutyb3 ),
    .\< ( s11 )
  );
  CompUnsigned #(
    .Bits(1)
  )
  CompUnsigned_i1 (
    .a( s0 ),
    .b( dutyb2 ),
    .\= ( s12 ),
    .\< ( s13 )
  );
  CompUnsigned #(
    .Bits(1)
  )
  CompUnsigned_i2 (
    .a( s3 ),
    .b( dutyb1 ),
    .\= ( s14 ),
    .\< ( s15 )
  );
  CompUnsigned #(
    .Bits(1)
  )
  CompUnsigned_i3 (
    .a( s9 ),
    .b( dutyb0 ),
    .\= ( s16 ),
    .\< ( s17 )
  );
  assign pwmmd = ((((((s12 & s11) | s13) & s14) | s15) & s16) | s17);
  assign s2 = (s0 ^ s1);
  assign s7 = (((s5 & s3) | (s3 & s4)) | ((s6 & s0) & s1));
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i4 (
    .D( s8 ),
    .C( clk_out),
    .Q( s9 ),
    .\~Q ( s10 )
  );
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i5 (
    .D( s7 ),
    .C( clk_out ),
    .Q( s3 ),
    .\~Q ( s6 )
  );
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i6 (
    .D( s2 ),
    .C( clk_out ),
    .Q( s0 ),
    .\~Q ( s4 )
  );
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i7 (
    .D( s5 ),
    .C( clk_out ),
    .Q( s1 ),
    .\~Q ( s5 )
  );
  assign s8 = ((s1 & (s0 & (s3 & s10))) | (((s4 | s6) | s5) & s9));
  
// Invertir las entradas para simular comportamiento de pull-down
  assign DL_inv = ~DL;
  assign DI_inv = ~DI;
  assign DD_inv = ~DD;

// Asociaciones lógicas usando las entradas invertidas
  
  assign m2r= (~DL_inv & ~DD_inv) | (DL_inv & DI_inv & DD_inv);
  assign m1r = (~DL_inv & ~DI_inv) | (~DL_inv & DD_inv);
  
  assign m2d = (DL_inv & ~DD_inv) | (~DL_inv & DI_inv & DD_inv);
  assign m1d = (DL_inv & ~DI_inv) | (DL_inv & DD_inv);
  
  assign pwmmi=pwmmd;
endmodule
