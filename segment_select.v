`timescale 1ns / 1ps
module segment_select(
output reg [7:0] sseg,
input [3:0] digit
    );
    always @(digit) begin
        case(digit)
        4'd0: sseg = 8'b11000000;
        4'd1: sseg = 8'b11111001;
        4'd2: sseg = 8'b10100100;
        4'd3: sseg = 8'b10110000;
        4'd4: sseg = 8'b10011001;
        4'd5: sseg = 8'b10010010;
        4'd6: sseg = 8'b10000010;
        4'd7: sseg = 8'b11111000;
        4'd8: sseg = 8'b10000000;
        4'd9: sseg = 8'b10010000;
        default: sseg = 8'b11111111;
        endcase
    end
endmodule
