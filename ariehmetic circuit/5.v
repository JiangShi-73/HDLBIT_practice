module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
wire [7:0] jin;
generate 
    genvar i ; 
    for(i = 0 ;i<7 ; i = i+1)begin:adder_6
    adder adder_inst(a[i],b[i],i==0?0:jin[i-1],jin[i],s[i]);
    end
endgenerate
assign s[7] = a[7] ^ b[7] ^ jin[6];
assign overflow = (a[7] & b[7] & ~s[7]) | (~a[7] & ~b[7] & s[7]);

endmodule
module adder( 
    input a, b, cin,
    output cout, sum );
assign sum = a ^ b ^ cin; // Sum is the XOR of a, b and cin
assign cout = a&b | (a|b)&cin;
endmodule
