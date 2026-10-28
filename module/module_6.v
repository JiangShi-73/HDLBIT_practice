module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire [15:0] sum1, sum2;
wire c1;
add16 adder1(a[15:0],b[15:0],0,sum1[15:0],c1);
add16 adder2(a[31:16],b[31:16],c1,sum2[15:0]);
assign sum = {sum2[15:0],sum1[15:0]};
endmodule
