`timescale 1ns/1ns
`define CYCLE 10

module testbench();
reg CLK, RST;
wire [4:0]result;

mock2 mock(.result(result), .clk(CLK), .rst(RST));
	
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
#500
	RST = 0;
	$finish;
end
endmodule
