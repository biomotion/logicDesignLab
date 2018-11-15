`timescale 1ns/1ns
`define CYCLE 1000
module testbench();

reg CLK, D;
wire Q, Qc;

flipflop ff(.Q(Q), .Qc(Qc), .CLK(CLK), .D(D));

//**************************** clock gen **********************//
always begin #`CYCLE CLK = ~CLK; end

initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end

initial begin
#0
	CLK = 0;
	D = 0;
#1	CLK = ~CLK;
#2 CLK = ~CLK;
#2000
	D = 1;
#4000
	D = 0;
#8000 $finish;
end
endmodule
