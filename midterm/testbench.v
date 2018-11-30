`timescale 1ns/1ns

module testbench();

reg [1:0] A, B;
wire [1:0] Q, R;

midterm_exam mid(.Q(Q), .R(R), .A(A), .B(B));

initial begin
	$dumpfile("tb.vcd");
	$dumpvars;
end

initial
begin
	#0	A = 0;
		B = 2;
	#1 A = 2;
		B = 2;
	#2 A = 3;
		B = 2;
	#3 A = 2;
		B = 3;
	#4	A = 0;
		B = 0;
end
endmodule 