// Dual-edge triggered flip-flop (dualedge)
// FPGA 没有双沿触发器，用两个单沿 FF + 一个二选一模拟
module top_module (
    input  clk,
    input  d,
    output q
);
    reg p, n;

    always @(posedge clk) p <= d;   // 上升沿抓一份
    always @(negedge clk) n <= d;   // 下降沿抓一份

    assign q = clk ? p : n;         // 时钟高选 p，低选 n
endmodule
