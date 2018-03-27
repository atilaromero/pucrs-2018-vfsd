
`timescale 1ns/1ns

module top_sqrt_svl;

	bit clk;
	always #10 clk = ~clk;
	
	interface_sqrt_svl interface_sqrt (clk);
	//interface_sqrt_svl interface_sqrt (.*);

	//mapping
	sqrt sqrt1(
		.clock(interface_sqrt.clk),
		.reset(interface_sqrt.rst),
		.endop(interface_sqrt.eop),
		.valor(interface_sqrt.val),
		.sqrt(interface_sqrt.out)
	);

	test_sqrt_svl tb1 (interface_sqrt);
	//test_sqrt_svl tb1 (interface_sqrt);

endmodule : top_sqrt_svl
