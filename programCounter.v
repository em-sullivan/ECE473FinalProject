// Eric Sullivan
// 10/10/2019
// PC Counter

module programCounter(

	input clk,
	input rst,
	input [31:0] pc_in,
	output reg [31:0] pc_out);
	
	initial begin
	
		pc_out = 0;
		
	end
	
	always@(posedge clk) begin
	
		if(rst == 1'b1) begin
		
			pc_out <= 0;
			
		end
		
		else begin
		
			pc_out <= pc_in;
			
		end
		
	end
	
endmodule
