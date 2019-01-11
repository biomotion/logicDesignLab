module fsm(number, clk, rst);
output [2:0] number;
input clk, rst;

wire qa, qb, qc, qa_c, qb_c, qc_c;
wire da, db, dc;
wire [1:0]cnt;
wire cnt_en;

flipflop a(qa, qa_c, clk, da, rst);
flipflop b(qb, qb_c, clk, db, rst);
flipflop c(qc, qc_c, clk, dc, rst);
counter count(cnt, clk, cnt_en);
assign cnt_en = qa_c&qb&qc;
assign da = qa_c&((qb_c&qc_c)|(qb&qc&cnt[0]&cnt[1]));
assign db = qa_c&qc;
assign dc = (qa_c&qb_c)|(qc&((qa&qb_c)|(qa_c&qb&!(cnt[0]&cnt[1]))));

assign number[2] = qa;
assign number[1] = qb;
assign number[0] = qc;

endmodule

module counter(counter, clk, rst);
output [1:0]counter;
input clk, rst;

wire c0_in, c1_in;
wire q0, q1, q0_c, q1_c;

flipflop cnt0(q0, q0_c, clk, c0_in, rst);
flipflop cnt1(q1, q1_c, clk, c1_in, rst);

assign c1_in = q1_c&q0;
assign c0_in = q1_c;
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
