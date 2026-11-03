module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

wire [98:0] jin;
generate 
    genvar i ; 
    for(i = 0 ;i<100 ; i = i+1)begin:adder_100
    adder adder_inst(a[i],b[i],i==0?cin:jin[i-1],i==99?cout:jin[i],sum[i]);
    end
endgenerate
endmodule

module adder( 
    input a, b, cin,
    output cout, sum );
assign sum = a ^ b ^ cin; // Sum is the XOR of a, b and cin
assign cout = a&b | (a|b)&cin;
endmodule
