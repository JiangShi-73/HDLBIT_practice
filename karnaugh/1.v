// 3-variable (kmap1)
// 只有 (a,b,c)=(0,0,0) 一格是 0，其余全 1
//   out = a | b | c
module top_module(
    input  a,
    input  b,
    input  c,
    output out
);
    assign out = a | b | c;
endmodule
