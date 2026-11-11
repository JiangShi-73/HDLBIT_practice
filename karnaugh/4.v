// 4-variable (kmap4)
// 棋盘格：任意一个输入翻转，输出就翻转 → 四变量奇偶校验
// 卡诺图上圈不出任何一对，只能写成 XOR 链
module top_module(
    input  a,
    input  b,
    input  c,
    input  d,
    output out
);
    assign out = a ^ b ^ c ^ d;
endmodule
