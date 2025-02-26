module SumOfNumbers2_10 #(binaryNumberWidth = 32,busWidth = 4,counterMod = 4,numberOfDigits=3) (
input [binaryNumberWidth - 1:0] binaryNumber,
input load,rst,clk,
output [numberOfDigits-1:0][busWidth - 1:0] BinaryDecimal,
output cOutShifter
);

wire cOutCounter;

reg [binaryNumberWidth - 1:0] counterDown;
always_ff @(posedge clk, posedge rst)
if (rst) 
		counterDown <= 0;

else if (cOutShifter || load) 
	if (load) 
		counterDown <= counterMod;
		else if (0 == counterDown)
			counterDown <= counterMod;
		else 
			counterDown <= counterDown - 1;
		
assign cOutCounter = !(counterDown == 0);


				
reg [binaryNumberWidth - 1:0] shifter;		
		
//reg cOutCounter = 1;	
		
always @(posedge clk, posedge rst)
	if (rst) 
		shifter <= 0;
	else if (cOutCounter || load) 
		if (load)
			shifter <= binaryNumber;
		else 
			shifter <= {1'b0,shifter[binaryNumberWidth - 1:1]};
	
	

	
	



assign cOutShifter = |shifter;

	
		
		
		
endmodule 
	