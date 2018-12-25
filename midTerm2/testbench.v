`timescale 1ns/1ns
`define CYCLE 100

module testbench();
reg CLK, RST;
wire fire;
wire [3:0]countdown;

mid2 mid(.fire(fire), .cd(countdown), .clk(CLK), .rst(RST));

always begin #`CYCLE CLK = ~CLK; end
initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end
initial begin
#0
	RST = 0;
	CLK = 0;

#100
	RST = 1;

#4000
	$finish;
end
endmodule
