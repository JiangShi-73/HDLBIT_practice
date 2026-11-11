// Combine circuits A and B (mt2015_q4)
// 结构：A|B 与 A&B 再异或
//   z = (IA1.z | IB1.z) ^ (IA2.z & IB2.z)
module top_module (
    input  x,
    input  y,
    output z
);
    wire z1, z2, z3, z4;

    A IA1 (x, y, z1);
    B IB1 (x, y, z2);
    A IA2 (x, y, z3);
    B IB2 (x, y, z4);

    assign z = (z1 | z2) ^ (z3 & z4);
endmodule

// 子电路 A：z = (x^y) & x
module A (
    input  x,
    input  y,
    output z
);
    assign z = (x ^ y) & x;
endmodule

// 子电路 B：z = ~(x^y)
module B (
    input  x,
    input  y,
    output z
);
    assign z = ~(x ^ y);
endmodule
