//Eric Sullivan
//10/10/2019
// ID_EX Pipe

module ID_EX (
	input clk,
	input rst,
	input [31:0] data_1_in,
	input [31:0] data_2_in,
	input [4:0] rd_in,
	output reg [31:0] data_1_out,
	output reg [31:0] data_2_out,
	output reg [4:0] rd_out);
	
	
	initial begin
	
		data_1_out = 0;
		data_2_out = 0;
		rd_out = 0;
		
	end
	
	always @(posedge clk) begin
	
		if (rst == 1'b1) begin
		
			data_1_out <= 0;
			data_2_out <= 0;
			rd_out <= 0;
			
		end
		
		else begin
		
			data_1_out <= data_1_in;
			data_2_out = data_2_in;
			rd_out = rd_in;
			
		end
		
	end
	
endmodule
		
		
		