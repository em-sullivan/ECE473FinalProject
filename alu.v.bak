module alu(

	input [31:0] reg1,
	input [31:0] reg2,
	input [3:0] op_code,
	input [4:0] shamt,
	output reg [31:0] result);
	
	always @* begin
	
		case(op_code)
		
			4'b0000: begin
			
				result = reg1 + reg2; 	//add
				
			end
			
			4'b0001: begin
			
				result = reg1 + reg2;	//addu
				
			end
			
			4'b0010: begin
			
				result = reg1 - reg2;
			
				
	

	