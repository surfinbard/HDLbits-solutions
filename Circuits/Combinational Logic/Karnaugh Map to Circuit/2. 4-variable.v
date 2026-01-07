module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = c&~d&~a | ~c&~d&~a | ~c&~a&~b | c&d&b | d&a&~b | ~c&a&~b;
    
endmodule
