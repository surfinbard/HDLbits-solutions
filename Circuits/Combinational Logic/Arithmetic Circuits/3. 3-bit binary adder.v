module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign {cout, sum} = cin + a + b;

endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire carry_out0, carry_out1, carry_out2;

    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .cout(carry_out0), .sum(sum[0]));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(carry_out0), .cout(carry_out1), .sum(sum[1]));
    full_adder fa2(.a(a[2]), .b(b[2]), .cin(carry_out1), .cout(carry_out2), .sum(sum[2]));
    assign cout = {carry_out2, carry_out1, carry_out0};

endmodule
