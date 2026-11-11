// NOR (exams/m2014_q4e)
// 或非门：先或，再取反
module top_module (
    input  in1,
    input  in2,
    output out
);
    assign out = ~(in1 | in2);
endmodule
