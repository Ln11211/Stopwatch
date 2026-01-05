`timescale 1ns / 1ps
//1-cycle edge pulses from a level signal. The previous d value is stored in d_old and then compared with current d to create a edge signal.
//If button is pressed, the pressed signal is assert high for 1 clock cycle
//If button is released, the released is asserted high for 1 clock cycle

// time  d_old  d  pressed  released
// 0       0    0     0        0
// 1       0    1     1        0
// 2       1    1     0        0
// 3       1    0     0        1 
module button_edge(pressed,released,clk,d);
 input clk, d;
 output pressed,released;
    reg d_old = 1'b0;
    always @(posedge clk) d_old <= d;

    assign pressed =  d & ~d_old;
    assign released = ~d &  d_old;
endmodule