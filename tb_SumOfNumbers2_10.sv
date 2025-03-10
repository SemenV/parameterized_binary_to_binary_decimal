`timescale 1ns/1ns
module tb_SumOfNumbers2_10 #(parameter binaryNumberWidth = 32,numberOfDigits=4) ();
	reg 										tb_clk = 1'b0;
	reg 										tb_rst = 1'b0;
	reg 										tb_load = 1'b0;
	reg [binaryNumberWidth - 1:0] 				tb_binaryNumber = '0;
	wire[numberOfDigits-1:0][3:0] 				tb_BinaryDecimal;
	wire 										tb_cOutShifter;


SumOfNumbers2_10 #(binaryNumberWidth,numberOfDigits) SumOfNumbers2_10_inst (
.clk(tb_clk),
.rst(tb_rst),
.binaryNumber(tb_binaryNumber),
.load(tb_load),
.BinaryDecimal(tb_BinaryDecimal),
.cOutShifter(tb_cOutShifter)
);

initial
begin 

	#0 tb_rst = 1'b1;
	#20 tb_rst = 1'b0;
	#25 tb_binaryNumber = 'h22B8;
	#20 tb_load = 1;
	#10 tb_load = 0;

	
		
	
	
	
	
	
	#10000 $stop;

end

	
always #10 tb_clk = ~tb_clk;

endmodule
