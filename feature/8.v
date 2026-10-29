module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

genvar i;
wire [99:0] cout1;
    generate
    for(i = 0 ;i<100;i++)begin: loop1
    
        bcd_fadd addi(a[i*4+3:i*4],b[i*4+3:i*4],i == 0 ? cin : cout1[i-1],i == 99?cout:cout1[i],sum[i*4+3:i*4]);
    
    end
    endgenerate
endmodule
