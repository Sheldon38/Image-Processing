//imageprocess
module imgprocess(outbyte,select,inbyte,value,threshold,clk);
    input clk;
    input [1:0] select;
    input [7:0] value,threshold,inbyte;
    output reg [7:0] outbyte;
    
    reg overflow,underflow;
    
    always@(*)
    begin
    case(select)
        2'd0 : begin 
                {overflow,outbyte}=inbyte+value;                    
                if(overflow) 
                outbyte=8'd255; 
               end 
        2'b01 : begin 
                {underflow,outbyte}=inbyte-value;                    //decreases brightness
                if(underflow)
                outbyte=8'd0;
               end
        2'b10 : begin                                   //binarises the image
                if(inbyte>=threshold)
                outbyte=8'd255;
                else
                outbyte=8'd0;
                end
        2'b11 : outbyte=255-inbyte;                    //inverts the image
        default : outbyte=inbyte;
    endcase
    end
    
endmodule

module tb_imgprocess;
reg [1:0] SELECT;
reg [7:0] VALUE,THRESHOLD,INBYTE;
reg CLK;
wire [7:0] OUTBYTE;
reg [7:0] MEM [0:98303];
reg [7:0] MEMOUT [0:98303];
integer count;

imgprocess img1(OUTBYTE,SELECT,INBYTE,VALUE,THRESHOLD,CLK);


initial
begin
    CLK=1'b1;
    forever #0.01 CLK=~CLK;
end
    
initial
begin
    $readmemh("im16.txt",MEM);          //path for reading orginal image
end

initial
begin
    
    SELECT=2'b01;VALUE=60;THRESHOLD=160;INBYTE=MEM[0];
    repeat(2) @(posedge CLK);
    for(count=0;count<=98303;count=count+1)
    begin
            @(posedge CLK)
            begin
            INBYTE=MEM[count];
            MEMOUT[count]=OUTBYTE;
            end            
    end
    $writememh("imgnew.txt",MEMOUT);            //path to write modified image
end

endmodule
