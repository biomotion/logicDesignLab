`timescale 1ns/1ns
`define CYCLE 10

module testbench();
reg CLK, RST;
wire [2:0]num;

mock1 mock(.number(num), .clk(CLK), .rst(RST));
	
always begin #`CYCLE CLK = ~CLK; end
initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end

initial begin
#0
	RST = 0;
	CLK = 0;
#20
	RST = 1;
#200
	RST = 0;
	$finish;
end
endmodule
