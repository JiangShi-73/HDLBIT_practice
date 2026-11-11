// Simple circuit B (mt2015_q4b)
// 题目只给波形，读出来是 XNOR：
//   x y -> z
//   0 0 -> 1
//   1 0 -> 0
//   1 1 -> 1
//   0 1 -> 0
module top_module (
    input  x,
    input  y,
    output z
);
    assign z = ~(x ^ y);
endmodule
