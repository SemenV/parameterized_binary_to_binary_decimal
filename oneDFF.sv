module oneDFF #(parameter width)(
input clk,rst,ena,
input [width-1:0] numIn,
output reg [width-1:0] numOut = '0
);
	always_ff @(posedge clk,posedge rst)
	if (rst)
		numOut <= '0;
	else if (ena)
		numOut <= numIn;
		
endmodule 