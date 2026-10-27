# HDL 学习 · 练习文件索引

> 这里存放跟着 **HDLBits** 做的练习。一个文件一道题，文件名按**保存顺序**编号，不代表题目序号。
> 跑题目的方法：把代码贴进 HDLBits 在线编辑器，或本地用 iverilog 编译（本机暂未安装）。

## 文件清单

| 文件 | 这道题做什么 | 关键语法 |
|---|---|---|
| `7458.v` | 7458 芯片的门级连线 | `assign` + 与/或 中间 wire |
| `vector.v` | 3 位向量拆成整向量 + 3 个单 bit | 位选择 `vec[2]` |
| `vector_in_more_detail.v` | 16 位拆成高字节 / 低字节 | part-select `[15:8]` |
| `vector_3.v` | 32 位按字节倒序 | part-select 四段 |
| `vector_4.v` | 按位 OR 与逻辑 OR 对比、向量取反 | `|` vs `||`、`~` |
| `vector_5.v` | 4 位输入的与/或/异或归约 | 归约 `&in` `|in` `^in` |
| `vector_6.v` | 6 个 5 位输入拼成 32 位 | 拼接 `{a,b,c,d,e,f,2'b11}` |
| `vector_7.v` | 8 位向量按位倒序 | `generate` + `for` + `genvar` |
| `vector_8.v` | 8 位符号扩展到 32 位 | 复制 `{24{in[7]}}` |
| `vector_9.v` | 5 位输入做 25 个两两比较 | 复制 `{5{x}}` + `generate` |
| `module_1.v` | 实例化 `mod_a` | 按名字连端口 |
| `module_2.v` | 按**位置**连接 6 个端口 | 位置连接（练习用） |
| `module_3.v` | 按**名字**连接 6 个端口 | `.port(sig)` |
| `module_4.v` | 三级 D 触发器组成移位寄存器 | 实例化 + 中间 wire |

## 命名约定

- `vector_N.v` 的 N 是**我第几个保存的**，不是 HDLBits 的题号。
- `module_N.v` 同理。`module_2` 和 `module_3` 是**同一道题**的两种写法（位置 / 名字）。
- 题目和文件的对应关系以上表为准。

## 待办

- [ ] `module_4.v` 目前三个 DFF 是**并联**的（都接 `.d(d)`、`.q(q)`），需要改成串联：`d → dff1 → dff2 → dff3 → q`。
- [ ] `module_2.v` 与 `module_3.v` 重复，可考虑只留 `module_3.v`。
