module midterm_exam(Q, R, A, B);
	output [1:0]Q, R;
	input [1:0]A, B;
	wire q00, q01, q000, q0000, q0001;
	wire r00, r01;
	wire [1:0]B_not, A_not;
	wire [1:0]r, q;
	not G1(B_not[0], B[0]);
	not G111(B_not[1], B[1]);
	not G2(A_not[0], A[0]);
	not G21(A_not[1], A[1]);


	and G3(q0000, B_not[1], B[0]);
	and G4(q0001, A[1], B[1]);
	or G5(q000, q0000, q0001);
	and G6(q00, A[0], q000);
	and G7(q01, A[1], A_not[0], B[1], B_not[0]);
	or G8(Q[0], q00, q01);	

	and G9(Q[1], A[1], B_not[1], B[0]);

	and G10(r00, A_not[1], A[0], B[1]);
	and G11(r01, A[1], A[0], B[1], B_not[0]);
	or G12(R[0], r00, r01);

	and G13(R[1], A[1], A_not[0], B[1], B[0]);

endmodule 