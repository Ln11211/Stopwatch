`timescale 1ns / 1ps

module BCD_SSEG(output [3:0] anode,
output [7:0] sseg,
input  [15:0] value,
input clk,
input refresh_clk);

wire [1:0] refresh_counter;
wire [3:0] an;
wire [7:0] seg;
reg rc_q;

refresh_rate_counter rrc(refresh_counter,refresh_clk,clk);
anode_select a_sel(an,refresh_counter);
 
wire [3:0] BCD0=value[3:0];
wire [3:0] BCD1=value[7:4];
wire [3:0] BCD2=value[11:8];
wire [3:0] BCD3=value[15:12];
wire [3:0] digit;
BCD_select bcd_sel(BCD0,BCD1,BCD2,BCD3,refresh_counter,digit);
segment_select seg_sel(seg,digit);

reg [3:0] an_r;
reg [7:0] seg_r;
always @(posedge clk) begin
  // use the same rising-edge detector as in refresh_rate_counter
  // (expose it from rrc or duplicate the 2FF edge detect here)
  // For simplicity, do the same edge detect locally:
  rc_q <= refresh_clk;
  if (refresh_clk & ~rc_q) begin
    an_r  <= an;
    seg_r <= seg;
  end
end

assign anode = an_r;
assign sseg  = seg_r;

endmodule
