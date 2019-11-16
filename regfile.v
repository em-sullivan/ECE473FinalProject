// Eric Sullivan
// 10/3/2019
// Register Files

module regfile(
	input wire [4:0] radd1,
	input wire [4:0] radd2,
	input wire [31:0] wdi,
	input wire [4:0] wadd,
	input wire wen,
	input wire res,
	input wire clk,
	input wire [4:0] radd_debug,
	input wire clk_debug,
	input [5:0] op_code,
	input [31:0] pc,
	
	output reg [31:0] dout1,
	output reg [31:0] dout2,
	output reg [31:0] dout_debug);
	
	integer i;
	reg [31:0] register[31:0]; //Internal registers
	
	
	initial begin	//Initialize registers
		for (i =0; i < 32; i = i + 1) begin 
		
			register[i] = i;
			
		end
		
		register[1] = -30;
		register[2] = 56;
		
	end
	
	always @(posedge clk) begin //Writes on the first half of the clock cycle
	
		if(res == 1'b1) begin //Resets data back to initial values
			for(i = 0; i < 32; i = i + 1) begin 
				
				register[i] = i;
				
			end
			
			register[1] <= -30;
			register[2] <= 56;
			
		end
		
		else if (wen == 1'b1) begin
			
			register[wadd] = wdi; //Write data into register
		
		end
		
		if (op_code == 6'b000011) begin //If function is jal
			
			register[31] = pc + 4;
			
		end
		
	end
	
	always @(negedge clk) begin //Reads on the second half of the clock cycle
	
		dout1 <= register[radd1]; //Which register is read from is based on read-in adresses
		dout2 <= register[radd2];
	
	end
	
	always @(negedge clk_debug) begin
	
		dout_debug <= register[radd_debug];
		
	end
	
endmodule
		