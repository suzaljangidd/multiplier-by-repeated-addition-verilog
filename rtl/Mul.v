`timescale 1ns/1ps
module Mul(Data_in,eqz,ldA,ldB,ldP,clrP,decB,clk);
input [15:0]Data_in;
input ldA,ldB,ldP,clrP,decB,clk;
output eqz;
wire [15:0]Areg,Bcnt,Preg,Sum,Bus;

assign Bus = Data_in;

//Load A register
PIPO_A A(Areg,Bus,ldA,clk);
//Load P register
PIPO_P P(Preg,Sum,clrP,ldP,clk);
//Load B register
B_CNTR B(Bcnt,Bus,decB,ldB,clk);
//Adder
ADD A1(Sum,Areg,Preg);
//Comparator module(Equal to Zero)
EQZ E(eqz,Bcnt);

endmodule
