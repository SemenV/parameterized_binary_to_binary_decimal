/* 
Используется для хранения и складывания числа одного
что бы загрузить число надо подать rst а потом сложить с нужным числом

*/


module digit_2_10 #(parameter busWidth)(
input clk,rst,bitin,
input [busWidth-1:0] numIn,
output [busWidth-1:0] numOut,
output reg bitOut = 0
);
reg [busWidth-1:0] storege = '0 ;
wire [busWidth-1:0] over6;
wire overflowOver6;
														//9				//6		0
assign {overflowOver6,over6} =  ((bitin + numIn + storege) > 5'b1001) ? 5'b0110:  5'b0000;

always_ff @(posedge clk)
	if (rst) 
		{bitOut,storege} <=  '0;
	else 
		{bitOut,storege} <= over6 + numIn + bitin + storege;
	
assign numOut = storege;

endmodule 