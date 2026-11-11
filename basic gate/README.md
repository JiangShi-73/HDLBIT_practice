# Basic Gates · 文件对照

> HDLBits › Circuits › Combinational Logic › **Basic Gates**（共 17 题）
> 文件编号 = 该组题目里的**顺序位置**（1 起）。

| 文件 | 题目 | 一句话 |
|---|---|---|
| `1.v` | Wire | 一根线，`assign out = in` |
| `2.v` | GND | 接 1'b0 |
| `3.v` | NOR | 或非门 |
| `4.v` | Another gate | `in1 & ~in2` |
| `5.v` | Two gates | XNOR 再 XOR |
| `6.v` | More logic gates | 七种门一次写完 |
| `7.v` | 7420 chip | 双 4 输入与非门 |
| `8.v` | Truth tables | 真值表化简成 SOP |
| `9.v` | Two-bit equality | `A == B` |
| `10.v` | Ring or vibrate? | 铃声 / 震动二选一 |
| `11.v` | Thermostat | 加热 / 制冷 / 风扇 |
| `12.v` | 3-bit population count | 数 1 的个数 |
| `13.v` | Gates and vectors | 相邻位与/或/异或 |
| `14.v` | Even longer vectors | 上一题的 100 位版 |
| `simple_circuit_a.v` | Simple circuit A | `z = (x^y) & x` |
| `simple_circuit_b.v` | Simple circuit B | 从波形读出 XNOR |
| `combine_ab.v` | Combine circuits A and B | A/B 各两次，再异或 |

## 注意

- 后三个（`simple_circuit_*.v`、`combine_ab.v`）用名字而不是编号，因为编号 10~14 已经被后面几题占了。
- `13.v` 用的是 `always @(*)`，但端口没声明成 `reg`，标准 Verilog-2001 会报错；改成 `assign` 更省事。
