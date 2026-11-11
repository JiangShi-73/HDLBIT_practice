// Two gates (exams/m2014_q4g)
// 第一级：in1 XNOR in2（异或门带输出小圈）
// 第二级：上一级结果 XOR in3
module top_module (
    input  in1,
    input  in2,
    input  in3,
    output out
);
    assign out = ~(in1 ^ in2) ^ in3;
endmodule
