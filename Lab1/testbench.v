`timescale 1ns/10ps

module testbench();

//********Signal In Reg**********//
reg [3:0] A, B;
reg Cin;

//********Signal Out Wire********//
wire [3:0] S;
wire Cout;

carryLookahead carryLookahead(.S(S), .Cout(Cout), .A(A), .B(B), .Cin(Cin));

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

initial
begin
	#0	A = 0;
		B = 0;
		Cin = 0;
	#1 A = 'b0101;
		B = 'b1010;
	#2 A = 'b1110;
		B = 'b1110;
	#3 A = 0;
		A = 0;
end
endmodule 