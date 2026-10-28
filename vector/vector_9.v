module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    wire [4:0] vec = {a, b, c, d, e};
    genvar i;
    generate
        for(i = 0;i<5;i=i+1) begin : xnor_loop
            assign out[24-i*5 : 20-i*5] = ~vec ^ {5{vec[4-i]}};
        end
    endgenerate
endmodule
