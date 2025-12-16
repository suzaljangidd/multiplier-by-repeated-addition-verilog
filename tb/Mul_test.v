`timescale 1ns/1ps
module Mul_test;
reg [15:0]data_in;
reg start,clk,reset;
wire done,eqz,ldA,ldB,ldP,clrP,decB;

//Instantiation
Mul uut(.Data_in(data_in),.eqz(eqz),.ldA(ldA),.ldB(ldB),.ldP(ldP),.clrP(clrP),.decB(decB),.clk(clk));
Mul_Contr UUT(.start(start),.done(done),.ldA(ldA),.ldB(ldB),.ldP(ldP),.clrP(clrP),.decB(decB),.clk(clk),.eqz(eqz),.reset(reset));

//Stimulus
always #5 clk = ~clk;

initial begin
    clk = 1'b0;
    reset = 1'b1;
    start = 1'b0;
    #3 reset = 1'b0;
    #1 start = 1'b1;
    @(posedge done);
    #5 $finish;
end

initial begin
    $monitor($time,"ns Clock = %b |A = %d | B = %d | preg = %d | done = %b",clk,uut.Areg,uut.Bcnt,uut.Preg,done);
    $dumpfile("Mul.vcd");
    $dumpvars(0,Mul_test);

    #6 data_in = 5;
    #10 data_in = 4;
end
endmodule
