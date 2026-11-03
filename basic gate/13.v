module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

always @(*) begin
    out_both = in[3:1] & in[2:0]; // AND gate for both
    out_any = in[3:1] | in[2:0];  // OR gate for any
    out_different = in[3:0] ^ {in[0], in[3:1]}; // XOR gate for different
end
endmodule

/*always @(*) begin
    for(integer i = 0; i < 2 ;i = i+1)begin
    out_both[i] = in[i+1] & in[i];
    out_any[i] = in[i+1] | in[i];
    end
    for(integer i = 0; i < 3 ;i = i+1)begin
        if(i == 3)begin
            out_different[i] = in[0] ^ in[i];
        end
        else begin
        out_different[i] = in[i+1] ^ in[i];
        end
    end
end
*/