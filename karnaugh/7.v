// Karnaugh map (exams/2012_q1g)
// 轴：列 x1x2，行 x3x4（题目特意提醒 x[4:1] 的位序）
// 化简结果：f = ~x1&x3 | ~x2&~x4 | x2&x3&x4
module top_module (
    input  [4:1] x,
    output f
);
    assign f = (~x[1] & x[3]) | (~x[2] & ~x[4]) | (x[2] & x[3] & x[4]);
endmodule
