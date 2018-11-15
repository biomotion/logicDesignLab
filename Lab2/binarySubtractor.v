module binarySubtractor(S, c, v, A, B, m);
output [3:0] S;
output c, v;
input [3:0] A, B;
input m;

wire [3:0] P, C;

assign C[0] = m;
assign P = B^{4{m}};
fullAdder fullAdder1(S[0], C[1], P[0], A[0], C[0]);
fullAdder fullAdder2(S[1], C[2], P[1], A[1], C[1]);
fullAdder fullAdder3(S[2], C[3], P[2], A[2], C[2]);
fullAdder fullAdder4(S[3], c, P[3], A[3], C[3]);

assign v = C[3] ^ c;

endmodule 