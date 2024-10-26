# Stopwatch
A Simple Stopwatch implemented on an FPGA board using Verilog HDL.



# Time elapsed counter testbench simulation

rst= 1 bit binary signal to reset count

clk = 1-bit binary signal to toggle count

ss = 6 bit register(stores upto 59D secs) to store the seconds elapsed.

mm = 6 bit register(stores upto 59D mins) to store the minutes elapsed.
![image](https://github.com/user-attachments/assets/9b0a3a67-2826-40b8-883f-c7c3f5203f32)

# Time elapsed counter Synthesized Schematic

Uses 40 Buffers and LUTs in total
![image](https://github.com/user-attachments/assets/d90e2acd-8ef0-4aa1-85bf-a8a1c7b8d5f3)
