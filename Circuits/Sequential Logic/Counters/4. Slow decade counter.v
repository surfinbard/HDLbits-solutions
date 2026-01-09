module top_module (
    input clk,
    input slowena,
    input reset,      
    output [3:0] q);

    reg [3:0] counter = 4'b0;
    assign q = counter;

    always @(posedge clk) begin
        if (reset | (counter == 4'd9 && slowena))
            counter = 4'b0;
        else 
            if (slowena)
                counter = counter + 1'b1; 
    end

endmodule
