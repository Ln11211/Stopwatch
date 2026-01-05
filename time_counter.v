`timescale 1ns / 1ps
module time_counter(sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens,clk,rst,count_1hz,running);
output reg [3:0] sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens;
input clk,rst,count_1hz,running;

always @(posedge clk) begin
    if(rst) begin
        sec_ones <= 4'b0;
        sec_tens <= 4'b0;
        min_ones <= 4'b0;
        min_tens <= 4'b0;
        hr_ones <= 4'b0;
        hr_tens <= 4'b0;
    end
    else begin
    if(running) begin
        if(count_1hz) begin
            if(sec_ones == 4'd9) begin 
            sec_ones <= 4'd0;
                if(sec_tens == 4'd5) begin 
                sec_tens <= 4'd0;
                    if(min_ones == 4'd9) begin 
                    min_ones <= 4'd0;
                        if(min_tens == 4'd5) begin
                         min_tens <= 4'd0;
                            if ((hr_tens == 9) && (hr_ones == 9)) begin
                                    // Rollover HH:MM:SS → 00:00:00
                                    hr_tens  <= 4'd0;
                                    hr_ones  <= 4'd0;
                                end else begin
                                    if (hr_ones == 4'd9) begin
                                        hr_ones <= 4'd0;
                                        hr_tens <= hr_tens + 4'd1;
                                    end else hr_ones <= hr_ones + 4'd1;
                                end
                                end else min_tens <= min_tens + 4'd1;
                        end else min_ones <= min_ones + 4'd1;

                    end else sec_tens <= sec_tens + 4'd1;
                end else sec_ones <= sec_ones + 4'd1;
            end
        end
      end
    end
endmodule