module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    reg [3:0] counter = 4'b0;
    assign q = counter;

    always @(posedge clk) begin
        if (reset | counter == 4'd15)
            counter = 4'b0;
        else 
            counter = counter + 1'b1; 
    end

endmodule
