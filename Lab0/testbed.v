`timescale 1ns/10ps

module testbed(); 
reg a;
reg b;
wire c;
simutest simutest(.c(c), .a(a), .b(b));

initial begin 
	$dumpfile("test.vcd");
	$dumpvars;
end 
 
initial begin
	#1 a = 0;
		b = 0;
	#2 a = 0;
		b = 1;
	#3 a = 1;
		b = 0;
	#4 a = 1;
		b = 1;
	#100 	a = 0;
			b = 0;
end 
endmodule 