module top_module (
    input        clk,
    input        reset,
    output [3:0] q
);
    wire c1 = q[0];
    wire c2 = q[0] & q[1];
    wire c3 = q[0] & q[1] & q[2];

    // JK 翻转：J=K=carry；复位时 J=0,K=1 → 清零
    jk_ff u0 (.clk(clk), .j(~reset),            .k(1'b1),        .Q(q[0]));
    jk_ff u1 (.clk(clk), .j(c1 & ~reset),       .k(c1 | reset),  .Q(q[1]));
    jk_ff u2 (.clk(clk), .j(c2 & ~reset),       .k(c2 | reset),  .Q(q[2]));
    jk_ff u3 (.clk(clk), .j(c3 & ~reset),       .k(c3 | reset),  .Q(q[3]));
endmodule

module jk_ff (
    input clk,
    input j,
    input k,
    output Q );
    
    // 1. 声明 D 触发器的输入信号线
    wire d_in;
    
    // 2. 根据 JK 触发器的特征方程计算 D 端的输入
    // D = J & ~Q  OR  ~K & Q
    assign d_in = (j & ~Q) | (~k & Q);
    
    // 3. 实例化 D 触发器（把算出来的 d_in 连到 D 端口，把输出连到 Q 端口）
    d_ff my_dff (
        .clk(clk),
        .d(d_in),
        .q(Q)
    );

endmodule

// 下面是题目提供的 D 触发器模块，保持原样即可
module d_ff (
    input clk,
    input d,
    output q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule