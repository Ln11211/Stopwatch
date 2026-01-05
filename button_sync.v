//Buttons are asynch so they might be registered not during the clk and 
//create metastability in the flipflops, so make them stable we use a synchronisation circuit
//A synchronisation circuit is just two cascaded flip flops with common clock.

`timescale 1ns / 1ps
module button_sync(sync,dsync,clk);
input dsync;
input clk; //this is system clk
output reg sync;

reg ff1=0;
always @(posedge clk) begin
ff1 <= dsync;
sync <= ff1;
end

endmodule
