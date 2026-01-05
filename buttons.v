`timescale 1ns / 1ps
module buttons(start,stop,split,reset,btns_inp,clk,clk_10khz);
input [3:0] btns_inp;
input clk,clk_10khz;
output start,stop,split,reset;

localparam integer N=4;

wire [3:0] btn_sync;
//module button_sync(sync,dsync,clk);
genvar i;
generate
for (i=0;i<N;i=i+1) begin 
    button_sync bs_u(btn_sync[i],btns_inp[i],clk); end
endgenerate

wire [3:0] btn_db;
//module btn_debounce(bn_db,sample_tick,bn_sync,clk);
generate
for (i=0;i<N;i=i+1) begin 
    btn_debounce bd_u(btn_db[i],clk_10khz,btn_sync[i],clk); end
endgenerate

wire [3:0] pressed,released;
//module button_edge(pressed,released,clk,d);
generate
for (i=0;i<N;i=i+1) begin 
    button_edge bed_u(pressed[i],released[i],clk,btn_db[i]); end
endgenerate

assign start = pressed[0];
assign stop = pressed[1];
assign split = pressed[2];
assign reset = pressed[3];

endmodule
