module generate_dff #(parameter numberOfDFF,busWidth) (
input clk,rst,
input [busWidth - 1:0] digitIn,
output [busWidth - 1:0] digitOut
);

wire [numberOfDFF:0][busWidth - 1:0] numInOut;


genvar i;
generate
for(i=0; i < numberOfDFF; i=i+1) begin: forloop
	oneDFF #(busWidth) oneDFF_inst(
	.clk(clk),
	.rst(rst),
	.numIn(numInOut[i]),
	.numOut(numInOut[i+1]));
end
endgenerate

assign digitOut = numInOut[numberOfDFF];
assign numInOut[0] = digitIn;


endmodule

