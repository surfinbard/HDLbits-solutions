module top_module( 
    input a, b, cin,
    output cout, sum );

    assign {cout, sum} = cin + a + b;

endmodule
