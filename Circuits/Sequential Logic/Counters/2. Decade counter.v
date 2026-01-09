module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    reg [3:0] counter;
    assign q = counter;

    always @(posedge clk) begin
        if (reset | counter == 4'd9)
            counter = 4'b0;
        else 
            counter = counter + 1'b1; 
    end

endmodule
