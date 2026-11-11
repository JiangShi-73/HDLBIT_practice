// Edge capture register (edgecapture) —— 捕获 1→0 并保持到 reset
module top_module (
    input         clk,
    input         reset,
    input  [31:0] in,
    output reg [31:0] out
);
    reg [31:0] in_prev;

    always @(posedge clk) begin
        if (reset)
            out <= 32'd0;
        else
            out <= out | (in_prev & ~in);   // 捕获下降沿并保持
        in_prev <= in;
    end
endmodule
