// DFF+gate (exams/m2014_q4d)
// 电路：D = in XOR Q（反馈），即 T 触发器
module top_module (
    input  clk,
    input  in,
    output reg out
);
    always @(posedge clk)
        out <= in ^ out;
endmodule
