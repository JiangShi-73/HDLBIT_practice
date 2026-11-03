module top_module(
    input  [2:0] in,
    output reg [1:0] out
);
    integer i;                        // ① 声明在外面
    always @(*) begin
        out = 2'd0;                   // ② 先清零
        for (i = 0; i < 3; i = i + 1) // ③ 3 次，全部 3 位
            out = out + in[i];        // ④ 累加到整体
    end
endmodule