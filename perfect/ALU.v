module ALU(A,B,C,clk,cho);

input [31:0] A,B;
output [31:0] C;

reg [31:0] r1,r2,r3,r5;
reg [63:0] r4;

input clk;

input [3:0] cho;




always @( posedge clk ) begin
if(A[31]==1'b1) r1 <= ~A[30:0] + 1;
else r1 <= A;

if(B[31]==1) r2 <= ~B[30:0] + 1;
else r2 <= B;
	case(cho)
	4'b0000 : r3 <= r1 + r2;		
	4'b0001 : r3 <= r1 - r2;
	4'b0010 : begin 
	
		r4 <= r1 * r2;
		r3<=r4[31:0];
	end
	4'b0011 : r3 <= r1 / r2;
	4'b0100 : r3 <= r1 & r2;
	4'b0101 : r3 <= r1 | r2;
	4'b0110 : r3 <= ~ r1;
	4'b0111 : r3 <= r1 ^ r2;
	4'b1000 : r3 <= r1 << 1;
	4'b1001 : r3 <= r1 >> 1;
	4'b1010 : r3 <= (r1+r2)/2;
	4'b1011 : r3 <= (r1>r2)? r1:r2;
	4'b1100 : r3 <= (r1>r2)? r2:r1;
	4'b1101 : r3 <= ~(r1+r2);
	4'b1110 : r3 <= r1 ^~ r2;
	4'b1111 : r3 <= r1 % r2;
	endcase 
	
	if(r3[31]==1)  r5 <= ~r3[30:0]+1;
	else r5 <= r3;
	
end



assign C = r5;

endmodule 