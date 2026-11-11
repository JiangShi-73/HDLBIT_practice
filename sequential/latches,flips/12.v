// Mux and DFF (exams/2014_q4a) —— 移位寄存器的一级
// 外层 mux 由 L 选择：L=1 并行装载 R
// 内层 mux 由 E 选择：E=1 移入 w，E=0 保持 Q
module top_module (
    input  clk,
    input  w,
    input  R,
    input  E,
    input  L,
    output reg Q
);
    always @(posedge clk) begin
        if (L)      Q <= R;
        else if (E) Q <= w;
        else        Q <= Q;
    end
endmodule
