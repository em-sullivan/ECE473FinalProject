//Eric Sullivan
//10/10/2019
//MEM_WB pipe

module MEM_WB(

	
	//clock and reset
	input clk,
	input rst,
	
	//data in and out
	input [31:0] data_in_a,
	input [31:0] data_in_b,
	output reg [31:0] data_out_a,
	output reg [31:0] data_out_b,
	
	//controller junk
	input reg_wen_in,
	input dmem_alu_in,
	input jr_in,
	input [4:0] regd_in, //either rd or rt from mux
	output reg reg_wen_out,
	output reg dmem_alu_out,
	output reg jr_out,
	output reg [4:0] regd_out);
	
	
	initial begin
		
		//data
		data_out_a = 0;
		data_out_b = 0;
		
		//control
		reg_wen_out = 0;
		dmem_alu_out = 0;
		jr_out = 0;
		regd_out = 0;
		
	end
	
	always @ (posedge clk) begin
	
		if(rst == 1'b1) begin
		
			//data
			data_out_a <= 0;
			data_out_b <= 0;
		
			//control
			reg_wen_out <= 0;
			dmem_alu_out <= 0;
			jr_out <= 0;
			regd_out <= 0;
			
		end
		
		else begin
		
			//data
			data_out_a <= data_in_a;
			data_out_b <= data_in_b;
		
			//control
			reg_wen_out <= reg_wen_in;
			dmem_alu_out <= dmem_alu_in;
			jr_out <= jr_in;
			regd_out <= regd_in;
			
		end
		
	end
	
endmodule
