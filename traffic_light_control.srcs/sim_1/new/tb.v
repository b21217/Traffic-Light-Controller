`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 18:44:37
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(
    );
    
    reg clk,rst;
    wire [3:0] east_lgt,west_lgt,north_lgt,south_lgt;
    
    trf_lgt_cont uut(clk,rst,east_lgt,west_lgt,north_lgt,south_lgt);  
    
    initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    end

always 
#5 clk = ~ clk;
endmodule
