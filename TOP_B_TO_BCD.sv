module TOP_B_TO_BCD #(parameter binaryNumberWidth = 32,numberOfDigits=6) (
input clk,load,
input [binaryNumberWidth - 1:0]		binaryNumber,
output [numberOfDigits-1:0][3:0] 	BinaryDecimal,
output enaOut
);

reg tmpDff1 = 0;
reg tmpDff2 = 0;

always_ff @(posedge clk)
begin
	casez ({load,tmpDff1,tmpDff2})
		3'b100: begin
			tmpDff1 <= 1;
			tmpDff2 <= 1;
		end
		3'b111: begin
		tmpDff1 <= 0;
		tmpDff2 <= 1;
		end
		3'b001: begin
		tmpDff1 <= 0;
		tmpDff2 <= 0;
		end
		3'b101: begin
			tmpDff1 <= 0;
			tmpDff2 <= 1;
		end
		default: begin 
			tmpDff1 <= 0;
			tmpDff2 <= 0;
		end 
		endcase
end
		
 

reg dffRst = 0;
always_ff @(posedge clk)
	dffRst <= tmpDff1;
	


SumOfNumbers2_10 #(binaryNumberWidth,numberOfDigits) SumOfNumbers2_10_inst (
.clk(clk),
.rst(tmpDff1),
.binaryNumber(binaryNumber),
.load(dffRst),
.BinaryDecimal(BinaryDecimal),
.enaOut(enaOut)
);

endmodule 