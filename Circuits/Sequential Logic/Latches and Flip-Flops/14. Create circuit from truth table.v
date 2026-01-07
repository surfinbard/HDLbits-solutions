module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @(posedge clk) begin
        if (j & k) 
            Q = ~Q;
        else begin
            if (j)
            	Q = 1'b1;
	        if (k)
    	        Q = 1'b0;
        end    
    end

endmodule
