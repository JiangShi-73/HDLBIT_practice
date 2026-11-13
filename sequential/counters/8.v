module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);
    // ---------- 秒 / 分：你的 JK 计数器 ----------
    count_0to9 ss1 (.clk(clk), .reset(reset), .enable(ena),                       .q(ss[3:0]));
    count_0to5 ss2 (.clk(clk), .reset(reset), .enable(ena && (ss[3:0] == 4'd9)),  .q(ss[7:4]));

    count_0to9 mm1 (.clk(clk), .reset(reset), .enable(ena && (ss == 8'h59)),      .q(mm[3:0]));
    count_0to5 mm2 (.clk(clk), .reset(reset),
                    .enable(ena && (ss == 8'h59) && (mm[3:0] == 4'd9)),           .q(mm[7:4]));

    // ---------- 时 / am-pm：一个 always 全包 ----------
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            pm <= 1'b0;
        end
        else if (ena && (mm == 8'h59) && (ss == 8'h59)) begin
            if (hh == 8'h11) begin
                hh <= 8'h12;
                pm <= ~pm;                       // 11→12 翻 pm
            end
            else if (hh == 8'h12)
                hh <= 8'h01;                     // 12→01
            else if (hh[3:0] == 4'd9)
                hh <= {hh[7:4] + 4'd1, 4'd0};    // 09→10
            else
                hh <= {hh[7:4], hh[3:0] + 4'd1};
        end
    end
endmodule

module count4 (
    input        clk,
    input        enable,
    input        load,
    input        reset,
    input  [3:0] d,
    output [3:0] Q
);
    always @(posedge clk) begin
        if (load)
            Q <= d;
        else if (enable&~reset)
            Q <= Q + 1'b1;
        else
            Q <= 4'b0;
    end
endmodule

module count_0to9 (
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

module count_0to5 (
    input        clk,
    input        reset,
    input        enable,
    output [3:0] q
);
    wire [4:1] o;        // ① 向量，不是数组
    wire [4:1] c;        // 进位：c[i] = "低位全是 1"

    assign c[1] = enable;
    wire carry;
    assign carry = q[2]&q[0];  // 进位输出
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