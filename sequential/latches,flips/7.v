// D Latch (exams/m2014_q4a)
// 电平敏感：ena=1 时透明，ena=0 时保持
// 没有 else → 综合出 latch（题目说这个 warning 是预期的）
module top_module (
    input  d,
    input  ena,
    output reg q
);
    always @(*) begin
        if (ena) q <= d;
    end
endmodule
