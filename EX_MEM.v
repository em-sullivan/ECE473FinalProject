//Eric Sullivan
//10/10/2019
//EX_MEM pipe

module EX_MEM (

	// clock and reset
	input clk,
	input rst,
	
	//data in and out
	input [31:0] data_1_in,
	input [31:0] data_2_in,
	output reg [31:0] data_1_out,
	output reg [31:0] data_2_out,
	
	
	//controller junk
	input reg_wen_in,
	input dmem_alu_in,
	input mem_wen_in,
	input jr_in,
	input [4:0] regd_in, //either rd or rt from mux
	output reg reg_wen_out,
	output reg dmem_alu_out,
	output reg mem_wen_out,
	output reg jr_out,
	output reg [4:0] regd_out);
	
	
	initial begin
	
		//data
		data_1_out = 0;
		data_2_out = 0;
		
		//control
		reg_wen_out = 0;
		dmem_alu_out = 0;
		mem_wen_out = 0;
		jr_out = 0;
		regd_out = 0;
		
	end
	
	always @(posedge clk) begin
	
		if (rst == 1'b1) begin
		
			//data
			data_1_out <= 0;
			data_2_out <= 0;
		
			//control
			reg_wen_out <= 0;
			dmem_alu_out <= 0;
			mem_wen_out <= 0;
			jr_out <= 0;
			regd_out <= 0;
			
		end
		
		else begin
			
			//data
			data_1_out <= data_1_in;
			data_2_out <= data_2_in;
		
			//control
			reg_wen_out <= reg_wen_in;
			dmem_alu_out <= dmem_alu_in;
			mem_wen_out <= mem_wen_in;
			jr_out <= jr_in;
			regd_out <= regd_in;
			
		end
		
	end
	
endmodule
		
		
		