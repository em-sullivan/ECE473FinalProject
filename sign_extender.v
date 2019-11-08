// Eric Sullivan
// 10/29/2019
// Sign-extender

module sign_extender(

	input wire [15:0] in_num,
	output reg [31:0] out_sign,
	output reg [31:0] out_zeroes);
	
	always @(in_num) begin
	
		out_sign = { {16{in_num[15]}}, in_num[15:0] };
		
		out_zeroes = 0;
		
		out_zeroes = out_zeroes + in_num;
		
		
	end

endmodule
