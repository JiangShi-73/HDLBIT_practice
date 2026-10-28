module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire c1;
wire [15:0] b1,b2;
assign b1 = b[15:0] ^ {16{sub}};
assign b2 = b[31:16] ^ {16{sub}};
add16 adder1(a[15:0],b1,sub,sum[15:0],c1);
add16 adder2(a[31:16],b2,c1,sum[31:16]);
endmodule
