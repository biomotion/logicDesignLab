module controller(clr_AF, incr_A, set_E, set_F, clr_E,
						start, A2, A3, clk, rst);
output clr_AF, incr_A, set_E, set_F, clr_E;
input start, A2, A3, clk, rst;

wire w1, w2, w3;
wire d0, d1;
wire G0, G1, G0_c, G1_c;

flipflop g0(G0, G0_c, clk, d0, rst);
flipflop g1(G1, G1_c, clk, d1, rst);

assign w1 = start&G0_c;
assign w2 = G0&G1_c;
assign w3 = A2&A3;
assign d0 = w1|w2;
assign d1 = w2&w3;

assign clr_AF = start&G0_c;
assign incr_A = w2;
assign set_E = w2&A2;
assign set_F = G1;
assign clr_E = w2&!A2;

endmodule


module flipflop(Q, Qc, CLK, D, RST);
input CLK, D, RST;
output Q;
output Qc;

wire S, R;
wire Sc, Rc;

nand g1(Sc, Rc, S);
nand g2(S, Sc, CLK, RST);
nand g3(R, Rc, CLK);
nand g4(Rc, R, D, RST);

nand g5(Q, Qc, S);
nand g6(Qc, Q, R, RST);

endmodule