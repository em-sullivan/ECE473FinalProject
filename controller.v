// Eric Sullivan and Elizabeth Williard
// 10/30/2019
// Controller module

module controller (

	input [31:0] ins,
	output reg reg_wen, //register write enable
	output reg reg_des, // rt or rd
	output reg dmem_alu, //controlls mux at writeback
	output reg mem_wen, //memory write enable
	output reg jr,
	output reg alu_sel, //Selects either rt or immediate
	output reg [4:0] alu_code,
	output reg jump);
	
	
	always @* begin
	
		if (ins[31:26] == 6'b000000) begin //If op-code is 0, r type instructions
			
			
			reg_wen = 1;
			reg_des = 0; //rd
			dmem_alu = 0; //alu result
			mem_wen = 0; 
			jr = 0;
			alu_sel = 0;
			jump = 0;
			
			if(ins[5:0] == 6'b100000) begin //add
			
				alu_code = 0;
				
			end else if(ins[5:0] == 6'b100001) begin //addu
			
				alu_code = 1;
				
			end else if(ins[5:0] == 6'b100010) begin //sub
			
				alu_code = 2;
				
			end else if(ins[5:0] == 6'b100011) begin //subu
			
				alu_code = 3;
			
			end else if(ins[5:0] == 6'b100100) begin //and
				
				alu_code = 4;
				
			end else if(ins[5:0] == 6'b100101) begin //or
			
				alu_code = 5;
				
			end else if(ins[5:0] == 6'b100111) begin //nor
			
				alu_code = 6;
				
			end else if(ins[5:0] == 6'b101010) begin //slt
			
				alu_code = 7;
				
			end else if(ins[5:0] == 6'b000000) begin //sll
			
				alu_code = 8;
				
			end else if(ins[5:0] == 6'b000010) begin //srl
			
				alu_code = 9;
				
			end else if(ins[5:0] == 6'b000011) begin //sra
			
				alu_code = 10;
				
			end else if(ins[5:0] == 6'b001000) begin //jr
			
				alu_code = 11;
				reg_wen = 0;	//disables regester write and enables jr jump
				jr = 1;
			
			end
			
			if (ins[31:0] == 0) begin //nop -- need to work on making this better
			
				alu_code = 12;
				
			end
		end
	
		else if (ins[31:26] != 6'b000000) begin //If op-code is not 0, then i and j type instructions

			if(ins[31:26] == 6'b001100) begin //andi
			
				reg_wen = 1;
				reg_des = 1; //rt
				dmem_alu = 0; //alu result
				mem_wen = 0; 
				jr = 0;
				alu_sel = 1;
				alu_code = 13;
				jump = 0;
			
			
			end else if(ins[31:26] == 6'b001101) begin //ori
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 0;
				mem_wen = 0;
				jr = 0;
				alu_sel = 1;
				alu_code = 14;
				jump = 0;
				
			end else if(ins[31:26] == 6'b001010) begin //slti
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 0;
				mem_wen = 0;
				jr = 0;
				alu_sel = 1;
				alu_code = 15;
				jump = 0;
				
			end else if(ins[31:26] == 6'b001000) begin // addi
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 0;
				mem_wen = 0;
				jr = 0;
				alu_sel = 1;
				alu_code = 16;
				jump = 0;
				
			end else if(ins[31:26] == 6'b001001) begin //addiu
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 0;
				mem_wen = 0;
				jr = 0;
				alu_sel = 1;
				alu_code = 17;
				jump = 0;
				
			end else if(ins[31:26] == 6'b100011) begin //lw
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 1;
				mem_wen = 0;
				alu_sel = 1;
				alu_code = 18;
				jump = 0;
				
			end else if(ins[31:26] == 6'b101011) begin //sw
			
				reg_wen = 0;
				reg_des = 1;
				dmem_alu = 1;
				mem_wen = 1;
				alu_sel = 1;
				alu_code = 19;
				jump = 0;
				
			end else if(ins[31:26] == 6'b001111) begin //lui
			
				reg_wen = 1;
				reg_des = 1;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 1;
				alu_code = 20;
				jump = 0;
				
			end else if(ins[31:26] == 6'b000010) begin //j
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 1;
				alu_code = 12;
				jump = 1;
				
			
			end else if(ins[31:26] == 6'b000011) begin //jal
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 1;
				alu_code = 12;
				jump = 1;
				
			end else if (ins[31:26] == 6'b000100) begin //beq
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 0;
				alu_code = 21;
				jump = 0;
				
			end else if (ins[31:26] == 6'b000101) begin //bne
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 0;
				alu_code = 22;
				jump = 0;
				
			end else if (ins[31:26] == 6'b000111) begin //bgtz
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 0;
				alu_code = 23;
				jump = 0;
				
			end else if (ins[31:26] == 6'b000001) begin //bgez
			
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 0;
				alu_code = 24;
				jump = 0;
				
				
			end else begin 
					
				reg_wen = 0;
				reg_des = 0;
				dmem_alu = 0;
				mem_wen = 0;
				alu_sel = 0;
				alu_code = 12;
				jump = 0;
				
			end
			
				
		
		end else begin
		
			reg_wen = 0;
			
		end
		
	end
		
	
	
	
endmodule
