module stateMachine(A, CLK, X, Y, RST);
input CLK, X, Y, RST;
output A;

wire D1, D2;

assign D1 = (X^Y);
assign D2 = (D1^A);
flipflop ff(.Q(A), .CLK(CLK), .D(D2), .RST(RST));


endmodule


module flipflop(Q, Qc, CLK, D, RST);
input CLK, D, RST;
output Q, Qc;

wire S, R;
wire Sc, Rc;

assign Sc = !(Rc&S);
assign S = !(Sc&CLK&RST);
assign R = !(Rc&CLK);
assign Rc = !(R&D&RST);

assign Q = !(Qc&S);
assign Qc = !(Q&R&RST);


endmodule
