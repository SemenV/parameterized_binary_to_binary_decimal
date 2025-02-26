`timescale 1ns/1ns
module tb_number_2_10 #(parameter numberOfDigits = 3,busWidth = 4) ();
	reg 			tb_clk = 1'b0;
	reg 			tb_rst = 1'b0;
	reg				tb_digitCIn = 0;
	reg		[busWidth * (numberOfDigits) - 1 :0] 	tb_digitIn = 0;
	wire	[busWidth * (numberOfDigits) - 1 :0]	tb_digitOut;
	wire 			tb_digitCOut;



number_2_10 #(numberOfDigits,busWidth) number_2_10_inst (
.clk(tb_clk),
.rst(tb_rst),
.digitCIn(tb_digitCIn),
.digitCOut(tb_digitCOut),
.digitIn(tb_digitIn),
.digitOut(tb_digitOut)
);

initial
begin 

	#0 tb_rst = 1'b1;
	#20 tb_rst = 1'b0;
	#25 tb_digitCIn = 0;
	#0 tb_digitIn = {4'b0101,4'b0101,4'b0101};
	#10 tb_digitCIn = 0;
	#0 tb_digitIn = '0;
	
		
	
	
	
	
	
	#200 $stop;

end

	
always #10 tb_clk = ~tb_clk;

endmodule
