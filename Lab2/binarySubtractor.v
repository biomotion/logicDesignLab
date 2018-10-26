module binarySubtractor(S, c, v, A, B, m);
output [4:0] S;
output c, v;
input [4:0] A, B;
input m;

wire [4:0] P, C;

assign C[0] = m;
assign P = B^{4{m}};
fullAdder fullAdder1(S[0], C[1], P[0], B[0], C[0]);
fullAdder fullAdder2(S[1], C[2], P[1], B[1], C[1]);
fullAdder fullAdder3(S[2], C[3], P[2], B[2], C[2]);
fullAdder fullAdder4(S[3], c, P[3], B[3], C[3]);

assign v = C[3] ^ c;

endmodule 