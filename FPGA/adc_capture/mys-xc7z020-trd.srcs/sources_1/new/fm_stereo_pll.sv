`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/03 22:13:15
// Design Name: 
// Module Name: fm_stereo_pll
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

module fm_stereo_pll
	(
		input				clk,
		input				en,				// enable for the input
		input signed [31:0]	atan_diff,
        
		output signed[11:0]	sin38khz
	);

	dds_fm_pilot	dds_i (
		.aclk					(clk),
		.aclken					(en),
		.s_axis_config_tvalid	(),
		.s_axis_config_tdata	(),
		.m_axis_data_tvalid		(),
		.m_axis_data_tdata		(),
		.m_axis_phase_tvalid	(),
		.m_axis_phase_tdata		()
	);
endmodule

