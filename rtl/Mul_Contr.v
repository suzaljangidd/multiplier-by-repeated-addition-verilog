`timescale 1ns/1ps
module Mul_Contr(start,done,ldA,ldB,ldP,clrP,decB,clk,eqz,reset);
input start,clk,eqz,reset;
output reg ldA,ldB,ldP,clrP,decB,done;
reg [2:0]state,next_state;
parameter S0=3'b000,
          S1=3'b001,
          S2=3'b010,
          S3=3'b011,
          S4=3'b100;

always @(posedge clk or posedge reset)
begin
    if(reset) 
      state <= S0;
    else
      state <= next_state;
end

always @(*)
begin
    next_state = state;
    case(state)
    S0 : if(start) next_state = S1;
    S1 : next_state = S2;
    S2 : next_state = S3;
    S3 : if(eqz) next_state = S4;
    S4 : next_state = S4;
    default : next_state = S0;
    endcase
end

always @(*)
begin
    //default
    ldA = 1'b0;
    ldB = 1'b0;
    ldP = 1'b0;
    clrP = 1'b0;
    decB = 1'b0;
    done = 1'b0;
    case(state)
      S1 : ldA = 1'b1;
      S2 : begin ldB = 1'b1; clrP = 1'b1; end
      S3 : begin if(!eqz) begin ldP = 1'b1; decB = 1'b1; end end
      S4 : done = 1'b1;
    endcase
end

endmodule
