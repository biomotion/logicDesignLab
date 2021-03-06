`timescale 1ns/1ns
`define CYCLE 100
module testbench();


reg [3:0] A, B;
reg m;

wire [3:0] S;
wire c, v;

binarySubtractor bs(.S(S), .c(c), .v(v), .A(A), .B(B), .m(m));

initial begin
	$dumpfile("result.vcd");
	$dumpvars;
end


initial begin
#0 
	m = 0;
	A = 'b0000;
	B = 'b0000;
	
#100 
	m = 1;
	A = 'b0111;
	B = 'b0010;
#200
	m = 1;
	A = 'b1010;
	B = 'b0001;
#300
	m = 1;
	A = 'b1111;
	B = 'b1101;
#400
	m = 1;
	A = 'b0011;
	B = 'b1110;
#1600
	m = 0;
	A = 'b0000;
	B = 'b0000;
		
end

endmodule
		