module top_module (
    input        clk,
    input        reset,
    output [3:1] ena,
    output [15:0] q
);
    wire [3:0] en;        
    assign en[0] = 1'b1;

    genvar i;
    generate
        for (i = 1; i < 4; i = i + 1) begin : bcd
            assign en[i] = (q[i*4-1 -: 4] == 4'd9) & en[i-1];
            count10 u (
                .clk    (clk),
                .reset  (reset),
                .enable (en[i]),
                .q      (q[i*4 +: 4])
            );
            end
        
    endgenerate

    // 个位单独接：一直计数
    count10 u0 (
        .clk    (clk),
        .reset  (reset),
        .enable (en[0]),
        .q      (q[3:0])
    );

    assign ena[3:1] = en[3:1];
endmodule

module count10 (
    input        clk,
    input        reset,
    input        enable,
    output [3:0] q
);
    wire [4:1] o;        // ① 向量，不是数组
    wire [4:1] c;        // 进位：c[i] = "低位全是 1"

    assign c[1] = enable;
    wire carry;
    assign carry = q[3]&q[0];  // 进位输出
    wire reset1;
    assign reset1 = reset | carry&enable;  // 复位信号
    generate
        genvar i;
        for (i = 1; i <= 4; i = i + 1) begin : jk_ff_gen
            if (i > 1)
                assign c[i] = c[i-1] & o[i-1];   // ② 只在 i>1 时才引用 i-1

            // ③ J/K 分开：reset 时 J=0,K=1 → 清零
            jk_ff jk_ff_inst (
                .clk(clk),
                .j  (c[i] & ~reset1),
                .k  (c[i] | reset1),
                .Q  (o[i])
            );
        end
    endgenerate

    assign q = {o[4], o[3], o[2], o[1]};   // ④ 把 o 接到 q
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