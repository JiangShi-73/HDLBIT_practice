module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
wire [3:0] sum_temp;
generate 
    genvar i ; 
    for(i = 0 ;i<4 ; i = i+1)begin:adder_4
    adder adder_inst(x[i],y[i],i==0?1'b0:sum_temp[i-1],i==3?sum[i+1]:sum_temp[i],sum[i]);
    end
endgenerate
endmodule

module adder( 
    input a, b, cin,
    output cout, sum );
assign sum = a ^ b ^ cin; // Sum is the XOR of a, b and cin
assign cout = a&b | (a|b)&cin;
endmodule
