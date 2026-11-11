// Create circuit from truth table (exams/ece241_2013_q7)
// 用 D 触发器 + 门搭 JK 触发器
//   J K | Qnext
//   0 0 | Qold
//   0 1 | 0
//   1 0 | 1
//   1 1 | ~Qold
// 特征方程：D = J&~Q | ~K&Q
module top_module (
    input  clk,
    input  j,
    input  k,
    output reg Q
);
    always @(posedge clk)
        Q <= (j & ~Q) | (~k & Q);
endmodule
