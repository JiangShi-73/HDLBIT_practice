# Latches and Flip-Flops · 文件对照

> HDLBits › Circuits › Sequential Logic › **Latches and Flip-Flops**（共 18 题）
> 文件编号 = 该组题目里的**顺序位置**（1 起）。

| 文件 | 题目 | 关键点 |
|---|---|---|
| `1.v` | D flip-flop | `always @(posedge clk) q <= d;` |
| `2.v` | D flip-flops | 8 位并联，一次搞定 |
| `3.v` | DFF with reset | **同步**复位 |
| `4.v` | DFF with reset value | 复位到 `0x34`；**下降沿** |
| `5.v` | DFF with asynchronous reset | **异步**复位，areset 进敏感列表 |
| `6.v` | DFF with byte enable | 高低字节分别使能 |
| `7.v` | D Latch | 电平敏感，没有 else → 预期出 latch |
| `8.v` | DFF | 异步复位 AR |
| `9.v` | DFF | 同步复位 R |
| `10.v` | DFF+gate | `out <= in ^ out`（反馈 = T 触发器） |
| `11.v` | Mux and DFF | 一级：L 选 r_in / q_in |
| `12.v` | Mux and DFF | 一级：L 装载 R，E 移入 w，否则保持 |
| `13.v` | DFFs and gates | 3 个 FF + NOR，注意初值 |
| `14.v` | Create circuit from truth table | JK 触发器 = D 触发器 + 门 |
| `15.v` | Detect an edge | 上升沿，输出只高一个周期 |
| `16.v` | Detect both edges | 任何边沿 |
| `17.v` | Edge capture register | 捕获下降沿并**保持** |
| `18.v` | Dual-edge triggered flip-flop | 2 个单沿 FF + 二选一 |

## 三组容易混的对照

**① 同步复位 vs 异步复位**

```verilog
always @(posedge clk)                    // 同步：reset 只在 if 里
always @(posedge clk or posedge reset)   // 异步：reset 也在敏感列表
```

**② 边沿检测 vs 边沿捕获**

| | 表达式 | 行为 |
|---|---|---|
| 脉冲（15/16） | `out <= in & ~in_prev` | 只高一个周期 |
| 捕获（17） | `out <= out \| (in_prev & ~in)` | 一直高到 reset |

**③ 上升沿 vs 下降沿**

| | 表达式 |
|---|---|
| 上升沿 0→1 | `in & ~in_prev` |
| 下降沿 1→0 | `in_prev & ~in` |
