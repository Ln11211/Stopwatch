//When buttons are pressed, it takes couple of sconds to register their press 
//This time is called debounce time, here I'm setting it to about 15 ms

`timescale 1ns / 1ps
module btn_debounce(bn_db,sample_tick,bn_sync,clk);
output reg bn_db;
input bn_sync;
input sample_tick;
input clk; //this is system clk 100MHz

parameter integer PRESS_COUNT=15;
localparam cwidth= PRESS_COUNT<=2 ? 2 : $clog2(PRESS_COUNT);
reg [cwidth-1:0] count = {cwidth{1'b0}};
always @(posedge clk) begin
 if(sample_tick) begin
    if(bn_sync==bn_db) count <={cwidth{1'b0}};
    else begin
        if(count == PRESS_COUNT-1) begin
            bn_db <= bn_sync;
            count <= {cwidth{1'b0}};
        end
        else count <= count+1'b1;
    end 
 end
end
endmodule
