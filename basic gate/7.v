// 7420 chip
// 7420 是"双 4 输入与非门"：一片里有两个独立的门
module top_module (
    input  p1a, p1b, p1c, p1d,
    output p1y,
    input  p2a, p2b, p2c, p2d,
    output p2y
);
    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);
endmodule
