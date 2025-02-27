module SumOfNumbers2_10 #(binaryNumberWidth = 32,numberOfDigits=3) (
input [binaryNumberWidth - 1:0] binaryNumber,
input load,rst,clk,
output [numberOfDigits-1:0][3:0] BinaryDecimal,
output to2_10Sum
);

wire cOutCounter;
wire cOutShifter;
reg [binaryNumberWidth - 1:0] counterDown;
always_ff @(posedge clk, posedge rst)
	if (rst) 
		counterDown <= 0;
	else if (cOutShifter || load) 
		if (load) 
			counterDown <= numberOfDigits - 2;
		else if (0 == counterDown)
			counterDown <= numberOfDigits - 2;
		else 
			counterDown <= counterDown - 1;
		
assign cOutCounter = (counterDown == (numberOfDigits - 2));

			
reg [binaryNumberWidth - 1:0] shifter;		
always @(posedge clk, posedge rst)
	if (rst) 
		shifter <= 0;
	else if (cOutCounter || load) 
		if (load)
			shifter <= binaryNumber;
		else 
			shifter <= {1'b0,shifter[binaryNumberWidth - 1:1]};
	
	
assign cOutShifter = |shifter;
assign to2_10Sum = cOutCounter && shifter[0];

	
		
		
		
endmodule 
	