// DFFs and gates (exams/ece241_2014_q4)
// 三个 DFF + 三个门，输出是 NOR
//   D1 = x ^ q1
//   D2 = x & ~q2      （用 Q̄ 反馈）
//   D3 = x ^ ~q3      （用 Q̄ 反馈）
//   z  = ~(q1 | q2 | q3)
// 初始值必须清零，否则第一个时钟沿前 ~q 不是 q 的反
module top_module (
    input  clk,
    input  x,
    output z
);
    reg q1 = 1'b0, q2 = 1'b0, q3 = 1'b0;

    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= x & ~q2;
        q3 <= x ^ ~q3;
    end

    assign z = ~(q1 | q2 | q3);
endmodule
