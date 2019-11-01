//Eric Sullivan
//10/10/2019
// ID_EX Pipe

module ID_EX (

	// clock and reset
	input clk,
	input rst,
	
	// data in and out
	input [31:0] data_1_in,
	input [31:0] data_2_in,
	output reg [31:0] data_1_out,
	output reg [31:0] data_2_out,
	
	//instructions in and out
	input [31:0] ins_in,
	output reg [4:0] rs_out,
	output reg [4:0] rt_out,
	output reg [4:0] rd_out,
	output reg [4:0] shamt_out,
	
	//controller junk
	input reg_wen_in,
	input reg_des_in,
	input dmem_alu_in,
	input jr_in,
	input [4:0] alu_code_in,
	output reg reg_wen_out,
	output reg reg_des_out,
	output reg dmem_alu_out,
	output reg jr_out,
	output reg [4:0] alu_code_out);
	
	
	initial begin
	
		//data
		data_1_out = 0;
		data_2_out = 0;
		
		//instruction
		rs_out = 0;
		rt_out = 0;
		rd_out = 0;
		shamt_out = 0;
		
		//controller
		reg_wen_out = 0;
		reg_des_out = 0;
		dmem_alu_out = 0;
		jr_out = 0;
		alu_code_out = 0;
		
	end
	
	always @(posedge clk) begin
	
		if (rst == 1'b1) begin
		
			//data
			data_1_out <= 0;
			data_2_out <= 0;
		
			//instruction
			rs_out <= 0;
			rt_out <= 0;
			rd_out <= 0;
			shamt_out <= 0;
		
			//controller
			reg_wen_out <= 0;
			reg_des_out <= 0;
			dmem_alu_out <= 0;
			jr_out <= 0;
			alu_code_out <= 0;
			
		end
		
		else begin
		
			//data
			data_1_out <= data_1_in;
			data_2_out <= data_2_in;
		
			//instruction
			rs_out <= ins_in[25:21];
			rt_out <= ins_in[20:16];
			rd_out <= ins_in[15:11];
			shamt_out <= ins_in[10:6];
			
			/* Note: Pipeline also needs to include input and output for sign-extended immediate, but
			we don't need to worry about that until I instructions. */
		
			//controller
			reg_wen_out <= reg_wen_in;
			reg_des_out <= reg_des_in;
			dmem_alu_out <= dmem_alu_in;
			jr_out <= jr_in;
			alu_code_out <= alu_code_in;
			
		end
		
	end
	
endmodule
		
		
		