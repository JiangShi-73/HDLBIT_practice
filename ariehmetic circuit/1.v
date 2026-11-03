module top_module( 
    input a, b,
    output cout, sum );
assign sum = a ^ b; // Sum is the XOR of a and b
assign cout = a & b; // Carry out is the AND of a and b
endmodule
