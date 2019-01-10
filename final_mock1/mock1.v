module mock1(counter, clk, rst);
output [1:0]counter;
input clk, rst;

wire c0_in, c1_in;
wire q0, q1;

flipflop cnt0(q0, c0_in, clk, c0_in, rst);
flipflop cnt1(q1, , clk, c1_in, rst);

assign c1_in = q0^q1;
assign counter[0] = q0;
assign counter[1] = q1;

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
