module db_plata(
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "E1"  *) 
input clk,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "J13"  *) 
input load,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "C9,E9,D8,C8,D11,E8,E10,D9"  *)
output reg [7:0] Digits,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "N13,N14,M12,N16,N15,P16,P15,R16"  *)
input [7:0] sw,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "L16,L15,K15,K16,J15,J16,J14"  *)
input [6:0] key,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "C14,D14,G11,F11,C11,D12"  *) 
output reg [5:0] digits_cs,
(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "C3" *)
output reg enaOut
);

reg [3:0] num;
reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;
reg [3:0] num4;
reg [3:0] num5;


TOP_B_TO_BCD #(15,6) TOP_B_TO_BCD_inst (
.clk(clk),
.load(!load),
.binaryNumber({~key,sw}),
.BinaryDecimal({num5,num4,num3,num2,num1, num0}),
.enaOut(enaOut)
);

initial
begin
digits_cs <= 6'b110111;
end 

reg [31:0] tmp = 0;



	
always @(posedge clk) 
if (tmp == 100_000)
begin
tmp<=0;
digits_cs <= {digits_cs[0],digits_cs[5:1]};


 case (digits_cs)
	6'b11_1101:
		num <= num0;
	6'b11_1110:
		num <= num1;
	6'b01_1111:
		num <= num2;
	6'b10_1111:
		num <= num3;
	6'b11_0111:
		num <= num4;
	6'b11_1011:
		num <= num5;
	default: 
		num <= 0;
	
endcase
 case(num)
	4'd0: Digits <= 8'b0011_1111;
	4'd1: Digits <= 8'b0000_0110;
	4'd2: Digits <= 8'b0101_1011;
	4'd3: Digits <= 8'b0100_1111;
	4'd4: Digits <= 8'b0110_0110;
	4'd5: Digits <= 8'b0110_1101;
	4'd6: Digits <= 8'b0111_1101;
	4'd7: Digits <= 8'b0000_0111;
	4'd8: Digits <= 8'b0111_1111;
	4'd9: Digits <= 8'b0110_1111;
	default: Digits <= 8'b1111_1111; 
endcase
end 
else tmp <= tmp+1;


endmodule 