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
	input [19:0] ins_in,
	input [31:0] sign_imm_in,
	output reg [4:0] rs_out,
	output reg [4:0] rt_out,
	output reg [4:0] rd_out,
	output reg [4:0] shamt_out,
	output reg [31:0] sign_imm_out,
	
	//controller junk
	input reg_wen_in,
	input reg_des_in,
	input dmem_alu_in,
	input mem_wen_in,
	input jr_in,
	input alu_sel_in,
	input [4:0] alu_code_in,
	input [31:0] pc_in,
	output reg reg_wen_out,
	output reg reg_des_out,
	output reg dmem_alu_out,
	output reg mem_wen_out,
	output reg jr_out,
	output reg alu_sel_out,
	output reg [4:0] alu_code_out,
	output reg [31:0] pc_out);
	
	initial begin
	
		//data
		data_1_out = 0;
		data_2_out = 0;
		
		//instruction
		rs_out = 0;
		rt_out = 0;
		rd_out = 0;
		shamt_out = 0;
		sign_imm_out = 0;
		
		//controller
		reg_wen_out = 0;
		reg_des_out = 0;
		dmem_alu_out = 0;
		mem_wen_out = 0;
		jr_out = 0;
		alu_sel_out = 0;
		alu_code_out = 0;
		pc_out = 0;
		
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
			sign_imm_out <=0;
		
			//controller
			reg_wen_out <= 0;
			reg_des_out <= 0;
			dmem_alu_out <= 0;
			mem_wen_out <= 0;
			jr_out <= 0;
			alu_sel_out <= 0;
			alu_code_out <= 0;
			pc_out <= 0;
			
		end
		
		else begin
		
			//data
			data_1_out <= data_1_in;
			data_2_out <= data_2_in;
		
			//instruction
			rs_out <= ins_in[19:15];
			rt_out <= ins_in[14:10];
			rd_out <= ins_in[9:5];
			shamt_out <= ins_in[4:0];
			sign_imm_out <= sign_imm_in;
			
			//controller
			reg_wen_out <= reg_wen_in;
			reg_des_out <= reg_des_in;
			dmem_alu_out <= dmem_alu_in;
			mem_wen_out <= mem_wen_in;
			jr_out <= jr_in;
			alu_sel_out <= alu_sel_in;
			alu_code_out <= alu_code_in;
			pc_out <= pc_in;
			
		end
		
	end
	
endmodule
		
		
		