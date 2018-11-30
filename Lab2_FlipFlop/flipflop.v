module flipflop(Q, Qc, CLK, D);
input CLK, D;
output Q, Qc;

wire S, R;
wire Sc, Rc;

assign Sc = !(Rc&S);
assign S = !(Sc&CLK);
assign R = !(Rc&CLK&S);
assign Rc = !(R&D);

assign Q = !(Qc&S);
assign Qc = !(Q&R);



endmodule
