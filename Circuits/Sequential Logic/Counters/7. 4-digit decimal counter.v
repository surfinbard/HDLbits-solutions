module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};

    always @(posedge clk) begin
        if (reset) 
            q = 0;
        
        else begin

            if (q[15:12] == 4'd9 && q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9) begin
                q[15:0] = 16'd0;
            end
            else begin 
                if (q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9) begin
                    q[11:0] = 12'd0;
                    q[15:12] = q[15:12] + 1'b1;
                end
                else begin

                    if (q[7:4] == 4'd9 && q[3:0] == 4'd9) begin
                        q[7:0] = 8'd0;
                        q[11:8] = q[11:8] + 1'b1;
                    end 
                    else begin
                        if (q[3:0] == 4'd9) begin
                            q[3:0] = 4'd0;
                            q[7:4] = q[7:4] + 1'b1;
                        end
                        else 
                            q[3:0] = q[3:0] + 1'b1;
                    end 
                end
            end
        end
    end


endmodule
