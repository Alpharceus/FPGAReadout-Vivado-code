# FPGAReadout-Vivado-code

This project includes code for the FPGA readout of SNSPD signals, tested on the Xilinx Zynq 7000 xc7z020iclg400-1L board. Currently, the code includes a test for the Time-to-Digital Converter (TDC). Testing for the Asynchronous-Correlated Digital Counter (ACDC) will follow soon.

## Instructions

To use this code:

1. Create a Vivado project on the specified FPGA (Xilinx Zynq 7000 xc7z020iclg400-1L board).
2. Add the following source files:
   - **Top.vhdl**: Create a source file named `Top.vhdl`, paste the code from `Top.vhdl`, and save it.
   - **tdc.vhdl**: Create a source file named `tdc.vhdl`, paste the code from `tdc.vhdl`, and save it.
   - **tb_top.vhdl**: Create a simulation file named `tb_top.vhdl`, paste the code from `tb_top.vhdl`, and save it.
3. Run the simulation.
