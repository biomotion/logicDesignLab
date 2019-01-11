`timescale 1ns/1ns
//`define CYCLE 10

module testbench();
reg [3:0]in0, in1, in2, in3, in4;
wire [3:0]out0, out1, out2, out3, out4;

bubbleSort bb(out0, out1, out2, out3, out4, in0, in1, in2, in3, in4);
	
//always begin #`CYCLE CLK = ~CLK; end
initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end

initial begin
#0
	in0 = 'b0000;
	in1 = 'b0101;
	in2 = 'b0001;
	in3 = 'b0011;
	in4 = 'b0110;
#500
	in0 = 0;
	in1 = 0;
	in2 = 0;
	in3 = 0;
	in4 = 0;

end
endmodule
