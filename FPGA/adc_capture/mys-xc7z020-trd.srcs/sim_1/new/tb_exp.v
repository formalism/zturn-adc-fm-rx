`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/29 21:18:13
// Design Name: 
// Module Name: tb_exp
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


module tb_exp();
    parameter signed[33:0] PI = (2.0 ** 29.0) * 3.1415926535897932384626433832795;
    parameter signed[33:0] PI2 = (2.0 ** 30.0) * 3.1415926535897932384626433832795;
initial begin
    $monitor ("PI=%X, PI=%X", PI, PI2);
end

endmodule
