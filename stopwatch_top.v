`timescale 1ns / 1ps

module stopwatch_top(anode,sseg,clk,btns_inp);
input clk;
input [3:0] btns_inp;
output [3:0] anode;
output [7:0] sseg;

wire [15:0] value;
reg running=1'b0;
wire start,stop,split,reset;
wire [3:0] sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens;
wire count_1hz,count_10k;

reg count_1hz_q;
always @(posedge clk) count_1hz_q <= count_1hz;
wire count_1hz_pulse = count_1hz & ~count_1hz_q;

buttons btns(start,stop,split,reset,btns_inp,clk,count_10k);
tick_tock clk_div(count_10k,count_1hz,clk,reset);
time_counter tc(sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens,clk,reset,count_1hz_pulse,running);
BCD_SSEG bcd(anode,sseg,value,clk,count_10k);

reg CS,NS;
wire running_next = reset ? 0 : stop ? 0 : start ? 1 : running;

assign value = {min_tens,min_ones,sec_tens,sec_ones};
//assign value = {4'd1, 4'd2, 4'd3, 4'd4};
always @(posedge clk) begin
    if(reset) running=1'b0;
    else running = running_next;
end

endmodule
