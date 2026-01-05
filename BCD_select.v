`timescale 1ns / 1ps
module BCD_select(
input [3:0] BCD0,
input [3:0] BCD1,
input [3:0] BCD2,
input [3:0] BCD3,
input [1:0] refresh_counter,
output reg [3:0] digit);

 always @(refresh_counter) begin
    case(refresh_counter)
        2'b00: digit = BCD0;
        2'b01: digit = BCD1;
        2'b10: digit = BCD2;
        2'b11: digit = BCD3;
        default: digit = BCD0;
     endcase
 end
endmodule
