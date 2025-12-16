//-------------------------------------------
module PIPO_A(out,in,LoadA,clock);
  input wire [15:0]in;
  input wire LoadA,clock;
  output reg [15:0]out;

  always @(posedge clock)begin
    if(LoadA) out <= in;
  end
endmodule

//--------------------------------------------
module PIPO_P(out,in,ClearP,LoadP,clock);
  input [15:0]in;
  input LoadP,ClearP,clock;
  output reg [15:0]out;

  always @(posedge clock)begin
    if(ClearP) out <= 0;
    else if(LoadP) out <= in;
  end
endmodule

//--------------------------------------------
module B_CNTR(out,in,decB,LoadB,clock);
  input [15:0]in;
  input decB,LoadB,clock;
  output reg [15:0]out;

  always @(posedge clock)begin
    if(LoadB) out <= in;
    else if(decB) out <= out - 1;
  end
endmodule

//--------------------------------------------
module ADD(out,in1,in2);
  input [15:0] in1,in2;
  output reg [15:0]out;

  always @(*)begin
    out = in1 + in2;
  end
endmodule

//---------------------------------------------
module EQZ(eqz,Bout);
  input [15:0]Bout;
  output eqz;
  
  assign eqz = (Bout == 0);
endmodule
