module reg4bit(
    input [3:0] D,
    input S1,S0,
    input SDR,SDL,
    input CLRb,
    input clk,
    output reg [3:0] Q
);
always @(posedge clk or negedge CLRb) begin
if(!CLRb)
Q<=4'b0000;
    else begin
        case({S1,S0})
        2'b00: 
        Q <= Q;
        2'b01:
        Q <= {Q[2],Q[1],Q[0],SDL};
        2'b10: 
        Q <= {SDR,Q[3],Q[2],Q[1]};
        2'b11:
        Q <= D;
        endcase
    end
end
endmodule


