`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2023 16:28:31
// Design Name: 
// Module Name: trf_lgt_cont
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


module trf_lgt_cont( clk,rst,east_lgt,west_lgt,north_lgt,south_lgt);
input clk,rst;
output reg [3:0] east_lgt,west_lgt,north_lgt,south_lgt;
   

////////////  parameter of signal colour with direction  //////////////////    
parameter green = 4'b000;
parameter red = 4'b0001;
parameter yellow = 4'b0010;
parameter east_gre_lgt = 4'b0011;
parameter west_gre_lgt = 4'b0100;
parameter north_gre_lgt = 4'b0101;
parameter south_gre_lgt = 4'b0110;
parameter east_yel_lgt = 4'b0111;                            
parameter west_yel_lgt = 4'b1000;
parameter north_yel_lgt = 4'b1001;
parameter south_yel_lgt = 4'b1010;

/////////////////////  register to store time and state //////////////////////
reg [4:0]count;
reg [3:0]signal;

///////////////////   defining time to glow the signals w.r.t. colour and direction both ///////////////

always @ (posedge clk or posedge rst) begin

  if (rst) begin
    signal = east_gre_lgt;
    count = 0;
  end
  
  else begin
  
   case(signal)
////////////////////////////////   green signal in east direction ///////////////////   
    east_gre_lgt: begin
    if (count == 5'b11100) begin
        signal = east_yel_lgt;
        count = 0;
    end
    else begin
        signal = east_gre_lgt;
        count = count + 1;
    end
    end
    
////////////////////////////////   yellow signal in east direction ///////////////////   
    east_yel_lgt: begin
    if (count == 5'b00100) begin
        signal = west_gre_lgt;
        count = 0;
    end
    else begin
        signal = east_yel_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   green signal in west direction ///////////////////   
    west_gre_lgt: begin
    if (count == 5'b11100) begin
        signal = west_yel_lgt;
        count = 0;
    end
    else begin
        signal = west_gre_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   yellow signal in west direction ///////////////////   
    west_yel_lgt: begin
    if (count == 5'b00100) begin
        signal = north_gre_lgt;
        count = 0;
    end
    else begin
        signal = west_yel_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   green signal in north direction ///////////////////   
    north_gre_lgt: begin
    if (count == 5'b11100) begin
        signal = north_yel_lgt;
        count = 0;
    end
    else begin
        signal = north_gre_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   yellow signal in north direction ///////////////////   
    north_yel_lgt: begin
    if (count == 5'b00100) begin
        signal = south_gre_lgt;
        count = 0;
    end
    else begin
        signal = north_yel_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   green signal in south direction ///////////////////   
    south_gre_lgt: begin
    if (count == 5'b11100) begin
        signal = south_yel_lgt;
        count = 0;
    end
    else begin
        signal = south_gre_lgt;
        count = count + 1;
    end
    end
////////////////////////////////   yel signal in south direction ///////////////////   
    south_yel_lgt: begin
    if (count == 5'b00100) begin
        signal = east_gre_lgt;
        count = 0;
    end
    else begin
        signal = south_yel_lgt;
        count = count + 1;
    end
    end
    
    endcase
    end
    end
    
 /////////////////////////  signal given to each direction //////////////////
 always @ (signal) begin
 
 case(signal)
 //////////////  green signal to east and remaining direction get red colour //////
   east_gre_lgt: begin
     east_lgt = green;
     west_lgt = red;
     north_lgt = red;   
     south_lgt = red;
 end
 
  //////////////  yellow signal to east and remaining direction get red colour //////
   east_yel_lgt: begin
     east_lgt = yellow;
     west_lgt = red;
     north_lgt = red;   
     south_lgt = red;
 end
 
  //////////////  green signal to west and remaining direction get red colour //////
   west_gre_lgt: begin
     east_lgt = red;
     west_lgt = green;
     north_lgt = red;   
     south_lgt = red;
 end
 
  //////////////  yellow signal to west and remaining direction get red colour //////
   west_yel_lgt: begin
     east_lgt = red;
     west_lgt = yellow;
     north_lgt = red;   
     south_lgt = red;
 end
 
  //////////////  green signal to north and remaining direction get red colour //////
   north_gre_lgt: begin
     east_lgt = red;
     west_lgt = red;
     north_lgt = green;   
     south_lgt = red;
 end
 
  //////////////  yellow signal to north and remaining direction get red colour //////
   north_yel_lgt: begin
     east_lgt = red;
     west_lgt = red;
     north_lgt = yellow;   
     south_lgt = red;
 end
 
  //////////////  green signal to south and remaining direction get red colour //////
   south_gre_lgt: begin
     east_lgt = red;
     west_lgt = red;
     north_lgt = red;   
     south_lgt = green;
 end
 
  //////////////  yellow signal to south and remaining direction get red colour //////
   south_yel_lgt: begin
     east_lgt = red;
     west_lgt = red;
     north_lgt = red;   
     south_lgt = yellow;
 end
 
 endcase
 end   
endmodule
