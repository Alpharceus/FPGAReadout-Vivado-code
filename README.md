# FPGAReadout-Vivado-code
These are the codes I've written for the FPGA Readout of SNSPD Signals project.

Currently, the code includes a test on the Xilinx Zynq 7000 xc7z020iclg400-1L board for the Time-to-Digital Converter (TDC). Testing for the Asynchronous-Correlated Digital Counter (ACDC) will follow soon.

To use this code:

  Create a Vivado project on the specified FPGA (Xilinx Zynq 7000 xc7z020iclg400-1L board).
  Add source files:
    Create a source file named Top.vhdl, paste the code from Top.vhdl, and save it.
    Create a source file named tdc.vhdl, paste the code from tdc.vhdl, and save it.
    Create a simulation file named tb_top.vhdl, paste the code from tb_top.vhdl, and save it.
  Run the simulation.
