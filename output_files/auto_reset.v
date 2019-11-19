

module auto_reset(

	input wire in_reset,
	output reg out_reset);
	
	initial begin
	
		out_reset = 1;
		
	end
	
	always @* begin
	
		out_reset = in_reset;
		
	end
	
endmodule
