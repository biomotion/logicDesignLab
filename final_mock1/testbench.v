`timescale 1ns/1ns
`define CYCLE 10

module testbench();
reg CLK, RST;
wire [1:0]count;

mock1 mock(.counter(count), .clk(CLK), .rst(RST));
	
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
#800
	RST = 0;
	$finish;
end
endmodule
