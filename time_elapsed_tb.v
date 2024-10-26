`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:// 
// Create Date: 10/26/2024 07:49:03 PM
// Design Name: 
// Module Name: time_elapsed_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module time_elapsed_tb();
reg rst,clk;
wire [5:0] mm,ss;
time_elapsed uut(mm,ss,clk,rst);
initial begin
    rst=1'b1;
    #2;
    rst=1'b0;
    clk=1'b1;
end
always #5 clk=~clk;
endmodule
