// Eric Sullivan and Elizabeth Williard
// 11/16/2019
// Concat

module concat(

	input [27:0] shift_adress,
	input [31:0] pc,
	output reg [31:0] jump_adress);
	
	always @* begin
	
		jump_adress = { pc[3:0], shift_adress[27:0]};
		
	end
	
endmodule

