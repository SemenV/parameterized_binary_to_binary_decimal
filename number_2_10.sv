module number_2_10  #(numberOfDigits = 3) ( 
input clk,rst,digitCIn,ena,
input [numberOfDigits-1:0][3:0] digitIn ,
output [numberOfDigits-1:0][3:0] digitOut  ,
output digitCOut 
);
//  			  i                j
wire [numberOfDigits-1:0][numberOfDigits:0][3:0] digitInOut  ;
wire  [numberOfDigits:0][numberOfDigits:0] digitCInOut  ;

assign digitCInOut[0][0] = digitCIn;

assign digitCOut = digitCInOut[numberOfDigits][numberOfDigits];

genvar l;
generate
for(l=0; l<numberOfDigits   ; l=l+1) begin: forloop4
assign digitInOut[l][0] = digitIn[l];
end
endgenerate

genvar k;
generate
for(k=0; k<numberOfDigits  ; k=k+1) begin: forloop3
assign digitOut[k] = digitInOut[k][numberOfDigits];
end
endgenerate

genvar i;
genvar j;
generate
for(i=0; i<numberOfDigits; i=i+1) begin: forloop1
for(j=0; j<numberOfDigits; j=j+1) begin: forloop2
	if (i == j) begin
		digit_2_10 digit_2_10_inst(	
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.bitin(digitCInOut[i][j]),
		.bitOut(digitCInOut[i+1][j+1]),
		
		.numIn(digitInOut[i][j]),
		.numOut(digitInOut[i][j+1]));
	end
	else 
		oneDFF #(4) oneDFF4_inst(
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.numIn(digitInOut[i][j]),
		.numOut(digitInOut[i][j+1]));
end
end
endgenerate


endmodule 



