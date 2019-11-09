//Eric Sullivan and Elizabeth Williard

module hazard_control(

	input [31:0] ins,
	input [31:0] if_id_ins,
	input [4:0] alu_code,
	output reg [31:0] nop,
	output reg stall);
	
	always @* begin
	
		nop = 0;
		stall = 0;
		
		if(if_id_ins[31:26] == 6'b100011) begin //If instruction was lw
		
			if (ins[31:26] == 0) begin
			
				if(ins[25:21] == if_id_ins[25:21] || ins[20:16] == if_id_ins[20:16]) begin
				
					stall = 1;
					
				end
				
			end else if (ins[25:21] == if_id_ins[20:16]) begin
			
				stall = 1;
				
			end
			
		end
		
	end
		
	
endmodule
