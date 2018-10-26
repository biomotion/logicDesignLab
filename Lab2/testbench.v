`timescale 1ns/10ps
module testbench();


reg [4:0] A, B;
reg m;

wire [4:0] S;
wire c, v;

binarySubtractor bs(.S(S), .c(c), .v(v), .A(A), .B(B), .m(m));

initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end

initial begin
	#0 m = 0;
		A = 'b0000;
		B = 'b0000;
	#10 A = 'b1111;
		B = 'b0101;
	#50 m = 0;
		A = 'b0000;
		B = 'b0000;
		
end

endmodule
		