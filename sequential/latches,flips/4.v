// DFF with reset value (dff8p)
// 同步复位，复位值是 0x34（不是 0）；且用【下降沿】
module top_module (
    input        clk,
    input        reset,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(negedge clk) begin
        if (reset) q <= 8'h34;
        else       q <= d;
    end
endmodule
