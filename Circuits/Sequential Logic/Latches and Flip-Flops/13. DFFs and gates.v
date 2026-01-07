module top_module (
    input clk,
    input x,
    output z
); 

    reg q0, q1, q2;
    wire d0, d1, d2;

    assign d0 = q0 ^ x;
    assign d1 = ~q1 & x;
    assign d2 = ~q2 | x;
    assign z = ~(q0 | q1 | q2);
        
    always @(posedge clk) begin
        q0 = d0; 
        q1 = d1; 
        q2 = d2;

    end

endmodule
