`timescale 1ns / 1ps
module refresh_rate_counter(
output reg [1:0] refresh_counter=0,
input refresh_clk,
input clk);

//here refresh_clk is 10 KHz, which is about 0.1ms. This means each 7segment display is turned on for 0.1ms.
//the refresh counter is used to select one among the four 7 segment displays

reg refresh_clk_prev;
always @(posedge clk) begin 
refresh_clk_prev <= refresh_clk;
if(refresh_clk & ~refresh_clk_prev) refresh_counter<=refresh_counter+1;
 end
endmodule
