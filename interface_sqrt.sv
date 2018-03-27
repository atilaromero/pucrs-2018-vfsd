
`timescale 1ns/1ns

interface interface_sqrt_svl (input bit clk);

  //variable declarations
  logic rst, eop;
  logic[15:0] val;
  logic[ 7:0] out;

endinterface
