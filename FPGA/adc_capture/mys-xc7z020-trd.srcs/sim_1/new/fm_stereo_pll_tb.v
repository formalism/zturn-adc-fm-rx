`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/03 23:22:02
// Design Name: 
// Module Name: fm_stereo_pll_tb
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

module fm_stereo_pll_tb();

	parameter CLK_PERIOD = 25;			// 40MHz

	reg			clk	=	1'b0;
	wire		en;

	reg[7:0]	cnt	=	8'h00;

	integer		dat [];
	integer		i	=	0;

	always #(CLK_PERIOD/2)
		clk		<=	!clk;

	fm_stereo_pll	dut (
		.clk		(clk),
		.en			(en),
		.atan_diff	(dat[i]),
		.sin38khz	()
	);

	assign	en	=	(cnt == 8'd40);

	always @(posedge clk) begin
		if (cnt >= 8'd79)			// 40MHz/80 = 500kHz
			cnt	<=	8'h00;
		else
			cnt	<=	cnt + 8'd1;

		if (en)
			i	=	i + 1;
	end

	initial begin
		$readmemh("fm_demod.txt", dat);
	end

/*
	Reference:
 https://sites.google.com/site/playsystemverilog/others/system_task
 https://japan.xilinx.com/support/answers/51327.html	(SystemVerilog data type support in Vivado)
  */
endmodule

