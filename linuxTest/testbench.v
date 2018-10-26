`timescale 1ns/10ps
`include "test.v"

module testbench();
reg a, b;
wire c;

test test(.c(c), .a(a), .b(b));

initial begin
    $dumpfile("result.vcd");
    $dumpvars;
end

initial begin
    #0  a = 0;
        b = 0;
    #1  b = 1;
    #2  a = 1;
    #3  b = 0;
    #4  a = 0;
end
endmodule

