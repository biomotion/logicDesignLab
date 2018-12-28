`timescale 1ns/1ns
`define CYCLE 100

module testbench();

wire clr_AF, incr_A, set_E, set_F, clr_E;
reg start, A2, A3, clk, rst;

controller c(clr_AF, incr_A, set_E, set_F, clr_E,
						start, A2, A3, clk, rst);
						
initial begin
	$dumpfile("result	.vcd");
	$dumpvars;
end

always begin #`CYCLE clk = ~clk; end

initial begin
#0		clk = 0;
		rst = 0;
		start = 0;
		A2 = 0;
		A3 = 0;
#50	rst = 1;
		start = 1;
#1000 A2 = 1;
#2000	A3 = 1;
		A2 = 0;
#3000 A2 = 1;
#4000	A2 = 0;
		A3 = 0;
#5000	$finish;
end
endmodule
