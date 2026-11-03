module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
generate 
    genvar i ; 
    for(i = 0 ;i<3 ; i = i+1)begin:adder_3
    adder adder_inst(a[i],b[i],i==0?cin:cout[i-1],cout[i],sum[i]);
    end
endgenerate

endmodule
module adder( 
    input a, b, cin,
    output cout, sum );
assign sum = a ^ b ^ cin; // Sum is the XOR of a, b and cin
assign cout = a&b | (a|b)&cin;
endmodule
