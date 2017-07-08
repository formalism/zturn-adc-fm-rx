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

	reg[20:0]			r_pinc				=	21'h1374B;		// nearly 19kHz
	reg					r_config_tvalid		=	1'b0;
	wire[31:0]			w_data;
	wire signed[9:0]	w_sin, w_cos;
	wire				w_dds_tvalid, w_fir_tready;
	reg					r_en;

	reg signed [41:0]	r_mul;
	wire signed [23:0]	w_fir_tdata_in;

	wire signed [31:0]	w_fir_tdata_out;
	wire				w_fir_tvalid;

	reg signed [31:0]	r_sum				=	32'd0;

	assign	w_sin	=	w_data[25:16];
	assign	w_cos	=	w_data[9:0];

	dds_fm_pilot	dds_i (
		.aclk					(clk),
		.s_axis_config_tvalid	(r_config_tvalid),
		.s_axis_config_tdata	({3'b000, r_pinc}),
		.m_axis_data_tvalid		(w_dds_tvalid),
		.m_axis_data_tready		(en),
		.m_axis_data_tdata		(w_data),
		.m_axis_phase_tvalid	(),
		.m_axis_phase_tready	(en),
		.m_axis_phase_tdata		()
	);

	// mixer
	always @(posedge clk) begin
		if (en)
			r_mul		<=	atan_diff * w_cos;
		else
			r_mul		<=	r_mul;

		r_en			<=	en;
	end

	assign	w_fir_tdata_in	=	r_mul[41:18];			// TODO

	// 500kHz * 0.042 = 21kHz
	// 500kHz * 0.04 = 20kHz
	fir_lpf_20kHz		fir_1 (
		.aclk					(clk),
		.s_axis_data_tvalid		(r_en),
		.s_axis_data_tready		(w_fir_tready),
		.s_axis_data_tdata		(w_fir_tdata_in),			// 24bit
		.m_axis_data_tvalid		(w_fir_tvalid),
		.m_axis_data_tdata		(w_fir_tdata_out)
	);

	always @(posedge clk) begin
		if (w_fir_tvalid)
			r_sum	<=	r_sum + w_fir_tdata_out;
		else
			r_sum	<=	r_sum;
	end

endmodule

