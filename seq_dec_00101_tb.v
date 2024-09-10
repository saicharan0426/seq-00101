`include "seq_dec_00101.v"
`timescale 1ns/1ns
module seq_dec_00101_tb;

reg in,clk,reset;
wire out;
integer l_delay;

seq_dec_00101 sq(in,clk,reset,out);

always #2 clk= ~clk; 

always @(posedge clk) begin
   $monitor( "time= %0t in=%0b out=%0b ",$time,in,out);
end
initial begin
   
    $dumpfile("seq_dec.vcd");
    $dumpvars;
    in<=0;
    reset<=1;
    clk<=0;
   //always @(posedge clk) begin
   // $monitor( "time= %0t in=%0b out=%0b ",$time,in,out);
    //end
    repeat (5) @(posedge clk);
    reset <=0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    
    #2
    $display("test complete");
    $finish;
end


endmodule
