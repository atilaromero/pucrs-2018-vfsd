
`timescale 1ns/1ns

module tb_sqrt_svl;

  //variable declarations
  logic clk, rst, eop;
  logic[15:0] val;
  logic[ 7:0] out;

  //mapping
  sqrt sqrt_mod(
    .clock(clk),
    .reset(rst),
    .endop(eop),
    .valor(val),
    .sqrt(out)
  );

  initial
    begin
      val <= 4; rst <= 0; #70;
      rst <= 1;
    end

  always 
    begin
      clk <= 1; #10;
      clk <= 0; #10;
    end

endmodule