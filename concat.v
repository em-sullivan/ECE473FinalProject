// Eric Sullivan and Elizabeth Williard
// 11/16/2019
// Concat

module concat(

	input [27:0] shift_address,
	input [31:0] pc,
	output reg [31:0] jump_address);
	
	always @* begin
	
	
		jump_address = { pc[31:28], shift_address[27:0]};
		
	end
	
endmodule

