
`timescale 1ns/1ns

module test_sqrt_svl (interface_sqrt_svl interface_sqrt);

	initial
	begin
		interface_sqrt.val <= 4; 
		interface_sqrt.rst <= 0; 
		#70;
		interface_sqrt.rst <= 1;
	end

	always@(posedge interface_sqrt.eop)
	begin
		if ($floor($sqrt(interface_sqrt.val)) == interface_sqrt.out)
			$display("SQRT(%0d) == %0d", interface_sqrt.val, interface_sqrt.out);
		else	
			$display("SQRT(%0d) /= %0d", interface_sqrt.val, interface_sqrt.out);
	
		interface_sqrt.val <= interface_sqrt.val + 1;
		interface_sqrt.rst <= 0; 
		#70;
		interface_sqrt.rst <= 1;
	end
     
endmodule
