`timescale 1ns/1ns
`define CYCLE 100

module testbench();
reg CLK, X, Y, RST;
wire A;

stateMachine FSM(.A(A), .CLK(CLK), .X(X), .Y(Y), .RST(RST));

always begin #`CYCLE CLK = ~CLK; end
initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end
initial begin
#0
	RST = 0;
	CLK = 0;
	X = 0;
	Y = 0;
#1
	RST = 1;
#1000
	X = 1;
	Y = 0;
#2000
	X = 1;
	Y = 1;
#3000
	X = 0;
	Y = 1;
#4000
	$finish;
end
endmodule
