// Minimum SOP and POS (exams/ece241_2013_q2)
// 数字 = a*8 + b*4 + c*2 + d
//   1 : 2, 7, 15
//   0 : 0, 1, 4, 5, 6, 9, 10, 13, 14
//   X : 3, 8, 11, 12
// SOP 两项；POS 三项（把 0 圈起来再取反）
module top_module (
    input  a,
    input  b,
    input  c,
    input  d,
    output out_sop,
    output out_pos
);
    assign out_sop = (b & c & d) | (~a & ~b & c);
    assign out_pos = c & (~b | d) & (~a | b);
endmodule
