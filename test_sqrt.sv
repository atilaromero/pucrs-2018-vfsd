
`timescale 1ns/1ns

module test_sqrt_svl (interface_sqrt_svl.TEST interface_sqrt);

  function int sqrt_good(int i);
    return $floor($sqrt(i));
  endfunction
  
  function int sqrt_bad(int i);
    return $ceil($sqrt(i));
  endfunction
  
  task check(int i);
    logic [15:0] predict;
    predict = sqrt_bad(i);
    assert (predict == interface_sqrt.out)
    else $error("val: %d; predicted: %d, got %d", interface_sqrt.out, predict, interface_sqrt.out);
  endtask

  task startcalc(input int i);
  		interface_sqrt.val <= i; 
	  interface_sqrt.rst <= 0;
    @(interface_sqrt.clk)
	  interface_sqrt.rst <= 1;
  endtask

	initial
	begin
	  for (int i=0; i<20; i++)
	  begin
      $display("checking %d", i);
      startcalc(i);
  		  @(posedge interface_sqrt.eop)
    		check(i);
    end
	end

endmodule