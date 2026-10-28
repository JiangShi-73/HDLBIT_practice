module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire [15:0] sum1, sum2 ;
wire c1;
add16 adder1 (
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(1'b0),
    .sum(sum[15:0]),
    .cout(c1)
);
add16 adder2 (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1),
    .sum(sum1[15:0]),
    .cout()
);
add16 adder3 (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(0),
    .sum(sum2[15:0]),
    .cout()
);
always @(c1)begin
    if(c1 == 1)begin
        sum[31:16] =sum1[15:0];
    end
    else begin
        sum[31:16] =sum2[15:0];
    end 
end
endmodule
