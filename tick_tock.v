`timescale 1ns / 1ps
module tick_tock(tick10k,tick1,clk,rst);
output reg tick10k,tick1;
input clk,rst;

integer counter_val_1=0;
integer counter_val_10k=0;
//Blackboard gives me 100MHz clock, I need 10kHz clock, so I use the formula,
//(100MHZ/(2*desired))-1 ==> so, 100Mhz/(2*10KHz) -1 ==> 5,000-1 ==> 4,999
localparam LIMIT_1hz=49_999_999;
localparam LIMIT_10khz=4_999; 

always @(posedge clk) begin
    if(rst) begin
        counter_val_1<=0;
        counter_val_10k<=0;
        tick1<=0;
        tick10k<=0;
    end else begin
        if(counter_val_10k==LIMIT_10khz) begin
            counter_val_10k<=0;
            tick10k <=~tick10k;
        end else counter_val_10k<=counter_val_10k+1;
        
        if(counter_val_1==LIMIT_1hz) begin
            counter_val_1<=0;
            tick1 <=~tick1; 
        end else counter_val_1<=counter_val_1+1;
      end
 end
endmodule
