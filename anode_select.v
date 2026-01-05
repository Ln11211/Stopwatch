`timescale 1ns / 1ps
module anode_select(
output reg [3:0] anode,
input [1:0] refresh_counter
    );
//depending on the refresh_counter value, the anode is turned down low for the selcted 7segment disaply
 always @(refresh_counter) begin
    case(refresh_counter)
        2'b00: anode=4'b1110;
        2'b01: anode=4'b1101;
        2'b10: anode=4'b1011;
        2'b11: anode=4'b0111;
        default: anode=4'b1111;
     endcase
 end
endmodule