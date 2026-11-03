module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

wire [2:0] jin;
generate 
    genvar i ; 
    for(i = 0 ;i<4 ; i = i+1)begin:adder4_4
    bcd_fadd adder_inst(a[i*4 + 3: i*4],b[i*4 + 3: i*4],i==0?cin:jin[i-1],i==3?cout:jin[i],sum[i*4 + 3: i*4]);
    end
endgenerate
endmodule