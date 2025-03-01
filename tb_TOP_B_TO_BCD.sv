`timescale 1ns/1ns
module tb_TOP_B_TO_BCD #(parameter binaryNumberWidth = 32,numberOfDigits=6) ();
	reg 										tb_clk = 1'b0;
	reg 										tb_load = 1'b0;
	reg [binaryNumberWidth - 1:0] 				tb_binaryNumber = '0;
	wire[numberOfDigits-1:0][3:0] 				tb_BinaryDecimal;
	wire 										tb_enaOut;


TOP_B_TO_BCD #(binaryNumberWidth,numberOfDigits) TOP_B_TO_BCD_inst (
.clk(tb_clk),
.binaryNumber(tb_binaryNumber),
.load(tb_load),
.BinaryDecimal(tb_BinaryDecimal),
.enaOut(tb_enaOut)
);

initial
begin 

	#25 tb_binaryNumber = 'h552D6;
	#20 tb_load = 1;
	#40 tb_load = 0;

	
		
	
	
	
	#10000  tb_load = 1;
	#120 tb_load = 0;
	
	#10000 $stop;

end

	
always #10 tb_clk = ~tb_clk;

endmodule
