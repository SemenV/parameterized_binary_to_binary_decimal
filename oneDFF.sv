module oneDFF #(parameter width)(
input clk,rst,
input [width-1:0] numIn,
output reg [width-1:0] numOut = '0
);
	always_ff @(posedge clk)
	if (rst)
		numOut <= '0;
	else 
		numOut <= numIn;
		
endmodule 