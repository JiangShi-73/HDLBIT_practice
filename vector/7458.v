module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire p1,p2,p3,p4;
assign p1 = p1a & p1c & p1b;
assign p3 = p2c & p2d;
assign p4 = p1f & p1e &p1d;
assign p2 = p2a & p2b;
assign p1y = p1 | p4;
assign p2y = p2 | p3;
endmodule