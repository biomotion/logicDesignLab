`timescale 1ns/1ns
module compareTest();

reg [3:0]in0, in1;
wire [3:0]out0, out1;

comparator c(out0, out1, in0, in1);

initial begin
    $dumpfile("result.vcd");
    $dumpvars;
end

initial begin
#0
    in0 = 5;
    in1 = 3;
#20
    in0 = 8;
    in1 = 0;
#40
    in0 = 0;
    in1 = 0;
end

endmodule
