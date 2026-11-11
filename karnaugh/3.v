// 4-variable (kmap3)
// 注意：这张图的列顺序是 ab = 01,00,10,11（非常规），看错就会全错
// 化简后只有两项：
//   a          覆盖 a=1 的 6 个 1（其余两个是 don't-care）
//   ~b & c     覆盖 m2,m3（借用了 don't-care）
module top_module(
    input  a,
    input  b,
    input  c,
    input  d,
    output out
);
    assign out = a | (~b & c);
endmodule
