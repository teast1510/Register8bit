module reg8bit (
    input  [7:0] D,
    input  S1, S0,
    input  clk,
    input  LSD, RSD,
    input  CLRb,
    output [7:0] Q
);

wire [3:0] D1, D0;
wire [3:0] Q1, Q0;
wire left, right;

assign D1 = D[7:4];
assign D0 = D[3:0];
assign Q  = {Q1, Q0};

assign left  = Q0[3];
assign right = Q1[0];

reg4bit dut0(
    .S1(S1),
    .S0(S0),
    .clk(clk),
    .Q(Q0),
    .CLRb(CLRb),
    .D(D0),
    .SDL(LSD),
    .SDR(right)
);

reg4bit dut1(
    .S1(S1),
    .S0(S0),
    .clk(clk),
    .Q(Q1),
    .CLRb(CLRb),
    .D(D1),
    .SDL(left),
    .SDR(RSD)
);

endmodule
