# Karnaugh Map to Circuit · 文件对照

> HDLBits › Circuits › Combinational Logic › **Karnaugh Map to Circuit**（共 8 题）
> 文件编号 = 该组题目里的**顺序位置**（1 起）。

| 文件 | 题目 | 化简结果 |
|---|---|---|
| `1.v` | 3-variable | `a \| b \| c` |
| `2.v` | 4-variable | 4 项 SOP |
| `3.v` | 4-variable | `a \| (~b & c)`（列顺序是 01,00,10,11） |
| `4.v` | 4-variable | `a ^ b ^ c ^ d`（棋盘格 = 奇偶校验） |
| `5.v` | Minimum SOP and POS | SOP 两项 / POS 三项，用到 don't-care |
| `6.v` | Karnaugh map (m2014_q3) | `~x[1]&x[3] \| x[2]&x[4]` |
| `7.v` | Karnaugh map (2012_q1g) | 三项 |
| `8.v` | K-map implemented with a multiplexer | 4 个 2 选 1 的输入函数 |

## 做卡诺图题的三条经验

1. **先看轴上的变量顺序**。标准是 00/01/11/10（格雷码），但 `3.v` 那张是 01/00/10/11，照抄会全错。
2. **1 是棋盘格 → 不是与或函数**，去想 XOR（`4.v`）。
3. **don't-care 是资源**，圈的时候当 1 用，能合并更大的组（`3.v`、`5.v`）。
