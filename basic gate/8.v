// Truth tables (truthtable1)
// 真值表：f=1 的行是 2(010)、3(011)、5(101)、7(111)
// 卡诺图圈两组：~x3 & x2（覆盖 2,3）、x3 & x1（覆盖 5,7）
module top_module(
    input  x3,
    input  x2,
    input  x1,
    output f
);
    assign f = (~x3 & x2) | (x3 & x1);
endmodule
