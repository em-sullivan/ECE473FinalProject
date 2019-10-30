module alu(

	input [31:0] reg1,
	input [31:0] reg2,
	input [4:0] op_code,
	input [4:0] shamt,
	output reg [31:0] result);
	
	always @* begin
	
		case(op_code)
		
			0: begin
			
				result = reg1 + reg2; 	//add
				
			end
			
			1: begin
			
				result = reg1 + reg2;	//addu
				
			end
			
			2: begin
			
				result = reg1 - reg2; //sub
			
			end
			
			3: begin
			
				result = reg1 - reg2; //subu
				
			end
			
			4: begin
			
				result = reg1 & reg2; //and
				
			end
			
			5: begin
			
				result = reg1 | reg2; //or
				
			end
			
			6: begin 
			
				result = reg1 ^ reg2; //nor
				
			end
			
			7: begin //slt
			
				if (reg1 < reg2) begin
					
					result = 1;
					
				end else
				
					result = 0;
				end
				
			
			end
			
			
			8: begin //sll
			
				result = reg1 << shamt;
			
			end
			
			9: begin //srl
			
				result = reg1 >> shamt;
			
			end
			
			10: begin //sra
			
			end
			
			11: begin //jr
			
			end
			
			12: begin //nop
			
				result = 0;
			
			end
			
			
			default: begin  end
			
		endcase
		
	end
	
endmodule
			
			
	

	