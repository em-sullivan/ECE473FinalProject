module alu(

	input [31:0] reg1,
	input [31:0] reg2,
	input [4:0] op_code,
	input [4:0] shamt,
	output reg [31:0] result);
	
	integer i;
	
	initial begin
	
		result = 0;
		
	end
	
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
			
				result = ~(reg1 | reg2); //nor
				
			end
			
			7: begin //slt
			
				if ($signed(reg1) < $signed(reg2)) begin
					
					result = 1;
					
				end else begin
				
					result = 0;
					
				end
				
			end
			
			8: begin //sll
			
				result = reg2 << shamt;
			
			end
			
			9: begin //srl
			
				result = reg2 >> shamt;
			
			end
			
			10: begin //sra ~ IDK if this is goin to work
			
				result = reg2 >> shamt;
				
				if(reg2[31] == 1'b1) begin
					
					for(i=0; i<shamt; i=i+1)begin
					
						result[31-i] = 1'b1;
						
					end
				end
				
			end
			
			11: begin //jr
			
				result = reg1;
			
			end
			
			12: begin //nop
			
				result = 0;
			
			end
			
			13: begin // andi
			
				result = reg1 & reg2;
				
			end
			
			14: begin // ori
			
				result = reg1 | reg2;
				
			end
			
			15: begin // slti 
			
				if (reg1 < reg2) begin
					
					result = 1;
					
				end else begin
				
					result = 0;
				
				end
				
			end
			
			16: begin //addi
			
				result = reg1 + reg2;
				
			end
			
			17: begin //addiu
			
				result = reg1 + reg2;
				
			end
			
			18: begin //lw
			
				result = reg1 + reg2;
				
			end
			
			19: begin //sw
			
				result = reg1 + reg2;
				
			end
			
			20: begin //lui
			
				result = reg2 << 16;
				
			end
			
			
			default: begin  end
			
		endcase
		
	end
	
endmodule
			
			
	

	