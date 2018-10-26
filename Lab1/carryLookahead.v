module carryLookahead(S, Cout, A, B, Cin);
	output [3:0] S; 
	output Cout;
	input [3:0] A, B;
	input Cin;

	wire [3:0]G, P, C;

	assign P = A^B;
	assign G = A&B;

	assign C[0] = Cin;
	assign C[1] = G[0] | (P[0]&Cin);
	assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[2]&Cin);
	assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&Cin);
	assign Cout = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&Cin);
	
	assign S = P^C;
endmodule 