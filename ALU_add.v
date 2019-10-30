module ALU_add (

	input wire [31:0] input_1,
	input wire [31:0] input_2,
	output reg [31:0] out);
	
	initial begin
		
		out = 0;
		
	end
	
	always @* begin
	
		out = input_1 + input_2;
		
	end
	
endmodule
