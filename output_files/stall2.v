module stall2(

	input stall,
	output reg stl);
	
	integer stallz;
	
	initial begin
	
		stallz = 0;
		
	end
	
	always @* begin
	
		if (stall == 1) begin
			
			stallz = 2;
			
		end
		
		if (stallz > 0) begin
			stl = 1;
			stallz = stallz - 1;
		
		end
		
	end
endmodule
