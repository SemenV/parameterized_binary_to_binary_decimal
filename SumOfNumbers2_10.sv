module SumOfNumbers2_10 #(binaryNumberWidth = 32,numberOfDigits=3) (
input [binaryNumberWidth - 1:0] binaryNumber,
input load,rst,clk,
output [numberOfDigits-1:0][3:0] BinaryDecimal,
output to2_10Sum
);
localparam counterWidth = $clog2(numberOfDigits - 1);
wire cOutCounter;
wire cOutShifter;
reg [counterWidth:0] counterDown;
always_ff @(posedge clk, posedge rst)
	if (rst) 
		counterDown <= 0;
	else if (cOutShifter || load) 
		if (load) 
			counterDown <= numberOfDigits - 1;
		else if (0 == counterDown)
			counterDown <= numberOfDigits - 1;
		else 
			counterDown <= counterDown - 1;
		
assign cOutCounter = (counterDown == 0);

			
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
wire [numberOfDigits-1:0][3:0] digitOUT2;
wire [numberOfDigits-1:0][3:0] digitIN2 = (cOutCounter) ? digitOUT2 : '0 ;

wire digitCOut;
number_2_10  #(numberOfDigits) number_2_10_inst ( 
.clk(clk),
.rst(rst),
.ena(1'b1),
.digitCIn(load),
.digitIn(digitIN2),
.digitOut(digitOUT2),
.digitCOut(digitCOut)
);		

assign BinaryDecimal = digitOUT2;		
		
endmodule 
	