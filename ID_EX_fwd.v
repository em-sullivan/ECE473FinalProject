module ID_EX_fwd(
	
	input [31:0] data_in,
	input [4:0] rs_in,
	input [4:0] mem_wb_regd,
	input [31:0] mem_wb_data,
	input jr,
	output reg [31:0] data_out);
	
	always @* begin
	
		if(jr == 1) begin
		
			data_out = data_in;
			
		end	
	
		else if(rs_in == mem_wb_regd) begin
		
			data_out = mem_wb_data;
			
		end
		
		else begin
		
			data_out = data_in;
			
		end
	end
	
endmodule
	