`include"fullAdder.v"
module bubbleSort();


endmodule

module mux(out, in0, in1, select);
output [2:0]out;
input [2:0]in0, in1;
input select;

assign out = (in0&!select) | (in1|select);

endmodule

module comparator(out0, out1, in0, in1);
output [2:0]out0, out1;
input [2:0]in0, in1;

wire select;
if() begin
    assign out0 = in0;
    assign out1 = in1;
end else begin
    assign out0 = in1;
    assign out1 = in0;
end

endmodule
