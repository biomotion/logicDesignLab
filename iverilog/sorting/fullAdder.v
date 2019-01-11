module fullAdder(s, cout, a, b, cin);
output s, cout;
input a, b, cin;

wire p;

assign p = a^b;
assign s = cin^p;
assign cout = (p&cin)|(a&b);

endmodule 