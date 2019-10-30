//Eric Sullivan
//10/10/2019
//IF_ID Pipe

module IF_ID (

	input clk,
	input rst,
	input [31:0] if_id_in,
	input [31:0] pc_in,
	output reg [31:0] pc_out,
	output reg [31:0] ins_out);
	
	
	initial begin
	
		ins_out = 0;
		pc_out = 0;
	
	end
	
	always @(posedge clk) begin
	
		if(rst == 1'b1) begin
		
			ins_out <= 0;
			pc_out <= 0;
	
			
			
		end
		
		else begin
		
			ins_out <= if_id_in;
			pc_out <= pc_in;
			
		end
		
	end
	
endmodule
