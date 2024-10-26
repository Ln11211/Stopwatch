`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2024 07:35:52 PM
// Design Name: 
// Module Name: time_elapsed
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


module time_elapsed(mm,ss,clk,rst);
input wire clk,rst;
output reg [5:0] mm,ss;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        mm<=6'd0;
        ss<=6'd0;
    end
    else begin
        if(ss==6'd59) begin
            ss<=6'd0;
            if(mm==6'd59) begin
                mm<=6'd0;
            end
            else begin
                mm<=mm+1'd1;
            end
        end
        else begin
            ss<=ss+1'd1;
        end
               
    end
    
end

endmodule
