//Eric Sullivan
//10/10/2019
//MEM_WB pipe

module MEM_WB(

	input clk,
	input rst,
	input [31:0] data_in_a,
	input [31:0] data_in_b,
	input [4:0] rd_in,
	output reg [31:0] data_out_a,
	output reg [31:0] data_out_b,
	output reg [4:0] rd_out);
	
	initial begin
	
		data_out_a = 0;
		data_out_b = 0;
		rd_out = 0;
		
	end
	
	always @ (posedge clk) begin
	
		if(rst == 1'b1) begin
		
			data_out_a <= 0;
			data_out_b <= 0;
			rd_out <= 0;
			
		end
		
		else begin
		
			data_out_a <= data_in_a;
			data_out_b <= data_in_b;
			rd_out <= rd_in;
			
		end
		
	end
	
endmodule
