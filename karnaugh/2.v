// 4-variable (kmap2)
// 4 个圈：
//   ~a&~d      覆盖 m0,m1,m2        （左侧两列 + 顶行环绕）
//   ~b&~c      覆盖 m0,m1,m8,m9     （左上 2x2）
//   ~a&b&c     覆盖 m6,m7
//   a&c&d      覆盖 m11,m15
module top_module(
    input  a,
    input  b,
    input  c,
    input  d,
    output out
);
    assign out = (~a & ~d) | (~b & ~c) | (~a & b & c) | (a & c & d);
endmodule
