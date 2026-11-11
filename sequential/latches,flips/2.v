// D flip-flops (dff8) —— 8 个并联的 DFF
module top_module (
    input        clk,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk)
        q <= d;
endmodule
