`include "comparator.v"
module bubbleSort(out0, out1, out2, out3, out4, in0, in1, in2, in3, in4);
output [3:0] out0, out1, out2, out3, out4;
input [3:0] in0, in1, in2, in3, in4;
input clk, rst;

wire [3:0]trans00, trans01, trans02, trans03, trans04;
wire [3:0]trans10, trans11, trans12, trans13, trans14;
wire [3:0]trans20, trans21, trans22, trans23, trans24;

oneCycle c0(trans00, trans01, trans02, trans03, trans04, in0, in1, in2, in3, in4);
oneCycle c1(trans10, trans11, trans12, trans13, trans14, trans00, trans01, trans02, trans03, trans04);
oneCycle c2(trans20, trans21, trans22, trans23, trans24, trans10, trans11, trans12, trans13, trans14);
oneCycle c3(out0, out1, out2, out3, out4, trans20, trans21, trans22, trans23, trans24);


endmodule

module oneCycle(out0, out1, out2, out3, out4, in0, in1, in2, in3, in4);
output [3:0] out0, out1, out2, out3, out4;
input [3:0] in0, in1, in2, in3, in4;
//input clk, rst;

wire [3:0]trans1, trans2, trans3;

comparator c0(out0, trans1, in0, in1);
comparator c1(out1, trans2, trans1, in2);
comparator c2(out2, trans3, trans2, in3);
comparator c3(out3, out4, trans3, in4);

endmodule





module delay(out, in, clk, rst);
output [3:0]out;
input [3:0]in;
input clk, rst;
flipflop f0(out[0], , clk, in[0], rst);
flipflop f1(out[1], , clk, in[1], rst);
flipflop f2(out[2], , clk, in[2], rst);
flipflop f3(out[3], , clk, in[3], rst);

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
