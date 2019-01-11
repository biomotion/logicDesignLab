`include "../fsm.v"

module mock2(result, clk, rst);
output [4:0] result;
input clk, rst;

wire [2:0]num;
wire [4:0]new;
wire [4:0]acc, lastAcc;
wire acc_rst;

fsm f(num, clk, rst);
decoder dec(new, num);
fiveBitAdder adder(acc, new, lastAcc);
accDelay delay(lastAcc, acc, clk, acc_rst);
assign acc_rst = !(!num[2]&!num[1]&!num[0])&rst;
assign result = acc;

endmodule



module decoder(out, in);
output [4:0]out;
input [2:0]in;

assign out[4:3] = 2'b00;
assign out[2:0] = in[2:0];

endmodule

module fiveBitAdder(sum, a, b);
output [4:0] sum;
input [4:0] a, b;

assign sum = a+b;
endmodule

module accDelay(out, in, clk, rst);
output [4:0]out;
input [4:0]in;
input clk, rst;
flipflop f0(out[0], , clk, in[0], rst);
flipflop f1(out[1], , clk, in[1], rst);
flipflop f2(out[2], , clk, in[2], rst);
flipflop f3(out[3], , clk, in[3], rst);
flipflop f4(out[4], , clk, in[4], rst);
endmodule
