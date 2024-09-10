module seq_dec_00101 (input in,clk,reset,output reg out);

 reg [2:0]ps,ns;
 parameter  a=0, b=1, c=2, d= 3, e= 4;

 initial begin
    ps <=0;
    ns <=0;
 end
 always @(posedge clk) begin
    if (reset ==1) begin
        ps <=a;
        out <=0;
        end
    else begin
        case(ps)
            a : begin
                 ns = in ? a : b ;
                 out=0;
                 end
            b : begin
                ns = in ? a :c;
                 out=0;
                 end
            c : begin
                ns = in ? d :c;
                out=0;
                 end
            d : begin
                ns = in ? a : e;
                out=0;
                 end
            e : begin
                    ns = in ? a : c;
                    out = 1;
                end 
        endcase
        //$display ("curent state is %0d next state is %0d", ps,ns);
        
        ps <=ns;
         
    end
 end

endmodule