	// Eric Sullivan and Elizabeth Williard
// 11/11/2019
// Branch controller

module branch_controller(

	input [31:0] pc,
	input [31:0] if_id_ins,
	input [31:0] reg_rs_data,
	input [31:0] reg_rt_data,
	input [31:0] sign_extend,
	
	input [4:0] id_ex_regd,
	input [31:0] id_ex_data,
	
	input[4:0] ex_mem_regd,
	input [31:0] ex_mem_data,
	
	input[4:0] mem_wb_regd,
	input [31:0] mem_wb_data,
	
	output reg [31:0] branch_address,
	output reg branch);
	
	integer data1, data2;
	
	always @* begin
	
		//Data 1
	
		if(if_id_ins[25:21] == id_ex_regd) begin
		
			data1 = id_ex_data;
			
		end else if (if_id_ins[25:21] == ex_mem_regd) begin
		
			data1 = ex_mem_data;
			
		end else if(if_id_ins[25:21] == mem_wb_regd) begin
		
			data1 = mem_wb_data;
		
		end else begin
		
			data1 = reg_rs_data;
			
		end
		
		//Data 2
		
		if(if_id_ins[20:16] == id_ex_regd) begin
		
			data2 = id_ex_data;
			
		end else if (if_id_ins[20:16] == ex_mem_regd) begin
		
			data2 = ex_mem_data;
			
		end else if(if_id_ins[20:16] == mem_wb_regd) begin
		
			data2 = mem_wb_data;
			
		end else begin
			
			data2 = reg_rt_data;
		end
	
		
		branch_address = pc + 4 + (sign_extend << 2);
		
		case(if_id_ins[31:26])
		
			6'b000100: begin //beq
			
				branch = (data1 == data2);
				
			end
			
			6'b000101: begin //bne
			
				branch = (data1 != data2);
				
			end
			
			6'b000111: begin //bgtz
			
				branch = (data1 > data2);
				
			end
			
			6'b000001: begin //bgez
			
				branch = (data1 >= data2);
				
			end
			
			default: begin
			
				branch = 0;
				
			end
		endcase
	
	end
	
endmodule
