module mid2(fire, cd, clk, rst);
output fire;
output [3:0]cd;
input clk, rst;

wire [3:0]q, qc;
flipflop ff0(q[0], qc[0], clk, qc[0], rst);
flipflop ff1(q[1], qc[1], cd[0], qc[1], rst);
flipflop ff2(q[2], qc[2], cd[1], qc[2], rst);
flipflop ff3(q[3], qc[3], cd[2], qc[3], rst);


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
