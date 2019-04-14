module ALUTest(key,keys,rst,enter,fout,serialIn,s);
input key,keys,rst,enter;
input [1:0] s;
output reg [31:0] fout;
output reg [7:0] serialIn;

always @(negedge rst,negedge key)
begin
  if (!rst) 
     begin
		serialIn<=8'b111;
	 end
  else
     if (keys==1'b0)  //input 0
        serialIn<=serialIn<<1;    
     else
        begin
            serialIn<={serialIn[6:0],1'b1};  
        end
 
 end    
always @(negedge enter or negedge rst)

    if(!rst)
		fout<=32'h000000CE;
	else
	    case (s)
          2'b00: fout[7:0]<=serialIn;
          2'b01: fout[15:8]<=serialIn;
          2'b10: fout[23:16]<=serialIn;
          2'b11: fout[31:24]<=serialIn;  
        endcase

endmodule       

 
