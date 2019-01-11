module comparator(out0, out1, in0, in1);
output [3:0]out0, out1;
input [3:0]in0, in1;

wire select;
mux m1(out0, in0, in1, in0>in1);
mux m2(out1, in0, in1, in0<=in1);

endmodule

module mux(out, in0, in1, select);
output [3:0]out;
input [3:0]in0, in1;
input select;

assign out = (in0&{4{!select}}) | (in1&{4{select}});

endmodule
