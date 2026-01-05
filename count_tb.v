`timescale 1ns / 1ps
module count_tb;

wire [3:0] sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens;
reg clk=0;
reg rst =0;
reg count_1khz=0;
time_counter uut(sec_ones,sec_tens,min_ones,min_tens,hr_ones,hr_tens,clk,rst,count_1khz);
always #1 clk=~clk;

  task automatic pulse_ce;
  begin
    @(posedge clk);
    count_1khz <= 1'b1;
    @(posedge clk);
    count_1khz <= 1'b0;
  end
  endtask

  // Advance N seconds (N pulses)
  task automatic tick_seconds(input integer N);
    integer i;
    begin
      for (i = 0; i < N; i = i + 1) begin
        pulse_ce();
      end
    end
  endtask

  initial begin
  #2 rst=1;
  #5 rst=0;
  tick_seconds(3600);
   end
endmodule
