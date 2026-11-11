// Karnaugh map (exams/m2014_q3)
// 轴：列 x1x2，行 x3x4
// 化简结果：f = ~x1&x3 | x2&x4
module top_module (
    input  [4:1] x,
    output f
);
    assign f = (~x[1] & x[3]) | (x[2] & x[4]);
endmodule
