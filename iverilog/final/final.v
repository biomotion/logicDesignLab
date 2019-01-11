`include"../fsm.v"
module final(out, clk, rst);
output [3:0] out;
input clk, rst;

wire [3:0]comp_in;
assign comp_in[3] = 0;
fsm f(comp_in[2:0], clk, rst);
comp c(out, comp_in);

endmodule

module comp(out, in);
output [3:0]out;
input [3:0]in;

wire [3:0]comp1;

assign comp1 = in^'b1111;
assign out = comp1+1;

endmodule
