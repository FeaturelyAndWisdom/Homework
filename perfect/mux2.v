module mux2(enter,f,s1,a_1,b_1);

input [31:0]f;
input enter;
input s1;


output reg[31:0]a_1,b_1;

always @( posedge enter ) begin
	case(s1)
		
		1'b0 :a_1=f;
		
		1'b1: b_1=f;
		
		endcase
end



endmodule 