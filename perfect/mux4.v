module mux4(Q,A,B,CE,C,OUT,s2);

input [31:0]A,B,CE,C,Q;

input [2:0]s2;

output [31:0] OUT;

reg [31:0] ou;
always @(*) begin
	case(s2)
		
		3'b000 :ou<=CE;
		
		3'b001: ou<=A;
		
		3'b010: ou<=B;
		
		3'B011: ou<=C;
		
		3'B100: ou<=Q;
		
		
		
		
	endcase
end

assign OUT = ou;

endmodule 