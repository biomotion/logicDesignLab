`timescale 1ns/1ns
//`define CYCLE 10

module testbench();
reg [3:0]in0, in1;
wire [3:0]out0;
reg select;

mux m(out0, in0, in1, select);

    
//always begin #`CYCLE CLK = ~CLK; end
initial begin
    $dumpfile("result.vcd");
    $dumpvars;
end

initial begin
#0
    in0 = 'b0000;
    in1 = 'b0101;
    select = 0;
#20
    select = 'b1;
#40
    in0 = 'b1111;
    in1 = 'b0110;
    select = 0;
#60 
    select = 'b1;
#100
    in0 = 0;
    in1 = 0;
end
endmodule
