module ID_EX_fwd(
	
	input [31:0] rs_data_in,
	input [4:0] rs_in,
	input [4:0] mem_wb_regd,
	input [31:0] mem_wb_data,
	input jr,
	output reg [31:0] rs_data_out,
	input [4:0] rt_in,
	input [31:0] rt_data_in,
	output reg [31:0] rt_data_out);
	
	always @* begin
	
		if(jr == 1) begin
		
			rs_data_out = rs_data_in;
			
		end	
	
		else if(rs_in == mem_wb_regd) begin
		
			rs_data_out = mem_wb_data;
			
		end
		
		else begin
		
			rs_data_out = rs_data_in;
			
		end
		
		if(jr == 1) begin
		
			rt_data_out = rt_data_in;
		
		end else if(rt_in == mem_wb_regd) begin
			
			rt_data_out = mem_wb_data;
			
		end else begin
			
			rt_data_out = rt_data_in;
			
		end
	end
	
endmodule
	