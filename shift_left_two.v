// Eric Sullivan
// 10/29/2019
// left-shift module

module shift_left_two(

	input wire [31:0] in,
	output reg [31:0] out);
	
	always @* begin
	
		out = in << 2;
		
	end
	
endmodule
