
module reg8bittb;
logic [7:0] D;
logic S1,S0;
logic [7:0] Q;
logic SDL,SDR;
logic clk;
logic rst_n;

reg8bit dut(
    .D(D),
    .S1(S1),
    .S0(S0),
    .Q(Q),
    .LSD(SDL),
    .RSD(SDR),
    .clk(clk),
    .CLRb(rst_n)
);
initial begin
D = 8'b1010_1010;
S1 = 1;
S0 = 1;
clk = 0;
rst_n = 0;
SDL =1;
SDR =0;
#20 
rst_n =1;
#20 S1 =1;
S0 = 0;
#20 
S1= 0;
S0 =1;
#20
S1 =0 ;
S0 = 0;
#30 $finish;
end

always #5 clk = ~clk;
endmodule
