module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
genvar i;
    generate 
        for(i=0;i<100;i=i+1) begin: loop1
            add_1bit u_add_1bit(
                .a(a[i]),
                .b(b[i]),
                .cin(i==0? cin: cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate
endmodule
module add_1bit(
    input a, b, cin,
    output cout, sum );
    assign cout = (a & b) | cin & (a | b);
    assign sum = a ^ b ^ cin;
endmodule
