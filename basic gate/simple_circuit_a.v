// Simple circuit A (mt2015_q4a)
// 题目直接给了函数：z = (x^y) & x
module top_module (
    input  x,
    input  y,
    output z
);
    assign z = (x ^ y) & x;
endmodule
