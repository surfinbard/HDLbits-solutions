module A (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);

    wire za1, zb1;

    A A1 (.z(za1), .x(x), .y(y));
    //A A2 (.z(za2), .x(x), .y(y));
    B B1 (.z(zb1), .x(x), .y(y));
    //B B2 (.z(zb2), .x(x), .y(y));

    assign z = (za1 | zb1) | (za1 & zb1); 

endmodule
