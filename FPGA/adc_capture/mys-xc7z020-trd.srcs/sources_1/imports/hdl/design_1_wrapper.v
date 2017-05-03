//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Mon Mar 13 20:33:29 2017
//Host        : DESKTOP-HFNSO6L running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper (
	inout[14:0]			DDR_addr,
	inout[2:0]			DDR_ba,
	inout				DDR_cas_n,
	inout				DDR_ck_n,
	inout				DDR_ck_p,
	inout				DDR_cke,
	inout				DDR_cs_n,
	inout[3:0]			DDR_dm,
	inout[31:0]			DDR_dq,
	inout[3:0]			DDR_dqs_n,
	inout[3:0]			DDR_dqs_p,
	inout				DDR_odt,
	inout				DDR_ras_n,
	inout				DDR_reset_n,
	inout				DDR_we_n,
    inout				FIXED_IO_ddr_vrn,
    inout				FIXED_IO_ddr_vrp,
    inout[53:0]			FIXED_IO_mio,
    inout				FIXED_IO_ps_clk,
    inout				FIXED_IO_ps_porb,
    inout				FIXED_IO_ps_srstb,
    inout				I2C0_SCL,
    inout				I2C0_SDA,
	inout				I2C1_SCL,
	inout				I2C1_SDA,
	input				ADC_CK,
	input signed[11:0]	AD,
	input				OFA,
	output				MUX,
	output				SHDNA,
	output				SHDNB,
	output[2:2]			LEDS,
	input[3:0]			SW,
	output				BP
);

	parameter signed[33:0] PI = (2.0 ** 29.0) * 3.1415926535897932384626433832795;
	parameter signed[33:0] PI2 = (2.0 ** 30.0) * 3.1415926535897932384626433832795;

	wire[63:0]	w_gpio_tri_t;
	wire[63:0]	w_gpio_tri_o;
	wire		w_clk40m;
	wire		w_tready, w_tvalid;
	wire[15:0]	w_sin3mhz, w_sin11mhz;
	reg[63:0]	r_axis_data;
	reg[7:0]	r_cnt;
	reg[2:0]	r_sw0;
	wire signed[11:0]	w_ad, w_ad2;
	wire		w_ofa, w_ofa2;
	wire		w_adck, w_fir_ck, w_locked;
	wire signed[16:0]	w_i, w_q;

	wire w_i_cic_en, w_q_cic_en;
	wire signed [31:0]	w_i_cic, w_q_cic;

	wire[31:0]	w_bram_adr, w_bram_dout;
	reg			r_axis_tvalid;

	wire		w_i_fir1_en, w_q_fir1_en;
	wire[55:0]	w_i_fir1, w_q_fir1;

	wire				w_atan_tvalid;
	wire signed[31:0]	w_atan_tdata;
	reg signed[31:0]	r_atan_tdata;
	reg signed[31:0]	r_atan_diff;
	wire signed[33:0]	w_atan_tdata2, r_atan_tdata2;

	wire signed[31:0]	w_fifo1_tdata, w_fifo2_tdata, w_fifo3_tdata, w_fifo4_tdata;
	wire				w_fifo1_tvalid, w_fifo2_tvalid, w_fifo3_tvalid, w_fifo4_tvalid;

	wire signed[31:0]	w_fir2_tdata;
	wire				w_fir2_tvalid, w_fir2_tready;

	wire signed[31:0]	w_fir3_tdata;
	wire				w_fir3_tvalid, w_fir3_tready;

	wire signed[31:0]	w_fir4_tdata;
	wire				w_fir4_tvalid, w_fir4_tready;

	wire signed[31:0]	w_result_data;
	wire				w_result_valid;

	assign	LEDS[2:2]	=	1'b1;
	assign	BP			=	1'b0;

	assign	SHDNA		=	1'b0;
	assign	SHDNB		=	1'b0;
	assign	MUX			=	SW[1];	// 2-7, High->Ch A, Low->Ch B

	BUFG bufg_inst (
		.I		(ADC_CK),
		.O		(w_adck)
	);

	generate
		genvar i;
		for (i = 0; i < 12; i = i + 1) begin
		IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_inst 
		(
			.R		(1'b0),
			.C		(w_adck),
			.CE		(1'b1),
			.D		(AD[i]),
			.Q1		(w_ad[i]),
			.Q2		(w_ad2[i])
		); end
	endgenerate;

	IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_ofa (
		.R		(1'b0),
		.C		(w_adck),
		.CE		(1'b1),
		.D		(OFA),
		.Q1		(w_ofa),
		.Q2		(w_ofa2)
	);

  design_1 design_1_i
       (.DDR_addr       		(DDR_addr),
        .DDR_ba         		(DDR_ba),
        .DDR_cas_n      		(DDR_cas_n),
        .DDR_ck_n       		(DDR_ck_n),
        .DDR_ck_p       		(DDR_ck_p),
        .DDR_cke        		(DDR_cke),
        .DDR_cs_n				(DDR_cs_n),
        .DDR_dm					(DDR_dm),
        .DDR_dq					(DDR_dq),
        .DDR_dqs_n				(DDR_dqs_n),
        .DDR_dqs_p				(DDR_dqs_p),
        .DDR_odt				(DDR_odt),
        .DDR_ras_n				(DDR_ras_n),
        .DDR_reset_n			(DDR_reset_n),
        .DDR_we_n				(DDR_we_n),
        .FCLK_CLK1_40M			(w_clk40m),
        .FIXED_IO_ddr_vrn		(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp		(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio			(FIXED_IO_mio),
        .FIXED_IO_ps_clk		(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb		(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb		(FIXED_IO_ps_srstb),
        .GPIO_0_tri_i			(64'd0),
        .GPIO_0_tri_o			(w_gpio_tri_o),
        .GPIO_0_tri_t			(w_gpio_tri_t),
        .IIC_0_scl_i			(iic_0_scl_i),
        .IIC_0_scl_o			(iic_0_scl_o),
        .IIC_0_scl_t			(iic_0_scl_t),
        .IIC_0_sda_i			(iic_0_sda_i),
        .IIC_0_sda_o			(iic_0_sda_o),
        .IIC_0_sda_t			(iic_0_sda_t),

        .IIC_1_scl_i			(iic_1_scl_i),
        .IIC_1_scl_o			(iic_1_scl_o),
        .IIC_1_scl_t			(iic_1_scl_t),
        .IIC_1_sda_i			(iic_1_sda_i),
        .IIC_1_sda_o			(iic_1_sda_o),
        .IIC_1_sda_t			(iic_1_sda_t),

		.s_axis_aclk				(w_adck),
		.s_axis_aresetn				(1'b1),
		.S_AXIS_tdata				(r_axis_data),
		.S_AXIS_tready				(w_tready),
		.S_AXIS_tvalid				(r_axis_tvalid),

		.M_AXIS_DATA_3MHZ_tdata		(w_sin3mhz),
		.M_AXIS_DATA_3MHZ_tvalid	(),
		.M_AXIS_DATA_11MHZ_tdata	(w_sin11mhz),
		.M_AXIS_DATA_11MHZ_tvalid	(),

		.BRAM_PORTB_addr			({w_bram_adr[29:0], 2'b00}),	// word aligned
		.BRAM_PORTB_clk				(w_adck),
		.BRAM_PORTB_din				(),
		.BRAM_PORTB_dout			(w_bram_dout),
		.BRAM_PORTB_en				(1'b1),
		.BRAM_PORTB_rst				(1'b0),
		.BRAM_PORTB_we				(1'b0)
	);

	mixer mixer_i (
		.clk						(w_adck),
		.bram_adr					(w_bram_adr),
		.bram_data					(w_bram_dout),
		.data						(w_ad),
		.i_out						(w_i),		// 17bit
		.q_out						(w_q)
	);

	cic cic_i (
		.clk						(w_adck),
		.d_in						(w_i),
		.en							(w_i_cic_en),
		.d_out						(w_i_cic)
	);
	cic cic_q (
		.clk						(w_adck),
		.d_in						(w_q),
		.en							(w_q_cic_en),
		.d_out						(w_q_cic)
	);

	gen_dsp_clk	gen_dsp_clk_i (
		.clk_in1					(w_adck),
		.clk_out1					(w_fir_ck),
		.reset						(1'b0),
		.locked						(w_locked)
	);

	fir_2_over_5_008 fir_i1 (
		.aclk						(w_adck),
		.s_axis_data_tvalid			(w_i_cic_en),
		.s_axis_data_tready			(),
		.s_axis_data_tdata			(w_i_cic),
		.m_axis_data_tvalid			(w_i_fir1_en),
		.m_axis_data_tdata			(w_i_fir1)
	);
	fir_2_over_5_008 fir_q1 (
		.aclk						(w_adck),
		.s_axis_data_tvalid			(w_q_cic_en),
		.s_axis_data_tready			(),
		.s_axis_data_tdata			(w_q_cic),
		.m_axis_data_tvalid			(w_q_fir1_en),
		.m_axis_data_tdata			(w_q_fir1)
	);

	atan	atan_i (
		.aclk						(w_adck),
		.s_axis_cartesian_tvalid	(w_i_fir1_en && w_q_fir1_en),
		.s_axis_cartesian_tdata		({w_i_fir1[49:2], w_q_fir1[49:2]}),		// imaginary 48bit, real 48bit
		.m_axis_dout_tvalid			(w_atan_tvalid),
		.m_axis_dout_tdata			(w_atan_tdata)
	);

	assign	w_atan_tdata2	=	{w_atan_tdata[31], w_atan_tdata[31], w_atan_tdata};
	assign	r_atan_tdata2	=	{r_atan_tdata[31], r_atan_tdata[31], r_atan_tdata};

	// differentiate neighboring angles
	always @(posedge w_adck) begin
		if (w_atan_tvalid) begin
			r_atan_tdata	<=	w_atan_tdata;

			if (w_atan_tdata2 - r_atan_tdata2 > PI)
				r_atan_diff	<=	w_atan_tdata2 - r_atan_tdata2 - PI2;
			else if (w_atan_tdata2 - r_atan_tdata2 < -PI)
				r_atan_diff	<=	w_atan_tdata2 - r_atan_tdata2 + PI2;
			else
				r_atan_diff	<=	w_atan_tdata2 - r_atan_tdata2;
		end
	end

	// 40MHz -> 160MHz
	axis_data_fifo_async fifo1 (
		.s_axis_aresetn		(w_locked),
		.m_axis_aresetn		(w_locked),
		.s_axis_aclk		(w_adck),
		.s_axis_tvalid		(w_atan_tvalid),
		.s_axis_tready		(),
		.s_axis_tdata		(r_atan_diff),
		.m_axis_aclk		(w_fir_ck),
		.m_axis_tvalid		(w_fifo1_tvalid),
		.m_axis_tready		(w_fir2_tready),
		.m_axis_tdata		(w_fifo1_tdata)
	);

	// fs(in) = 500kHz, fs(out) = 200kHz, fc = 80kHz
	fir_2_over_5_008_2 fir2 (
		.aclk					(w_fir_ck),
		.s_axis_data_tvalid		(w_fifo1_tvalid),
		.s_axis_data_tready		(w_fir2_tready),
		.s_axis_data_tdata		(w_fifo1_tdata),
		.m_axis_data_tvalid		(w_fir2_tvalid),
		.m_axis_data_tdata		(w_fir2_tdata)
	);

	axis_data_fifo fifo2 (
		.s_axis_aresetn		(w_locked),
		.s_axis_aclk		(w_fir_ck),
		.s_axis_tvalid		(w_fir2_tvalid),
		.s_axis_tready		(),
		.s_axis_tdata		(w_fir2_tdata),
		.m_axis_tvalid		(w_fifo2_tvalid),
		.m_axis_tready		(w_fir3_tready),
		.m_axis_tdata		(w_fifo2_tdata)
	);

// fs(in) = 200kHz, fs(out) = 120kHz, fc = 48kHz
	fir_3_over_5_008 fir3 (
		.aclk					(w_fir_ck),
		.s_axis_data_tvalid		(w_fifo2_tvalid),
		.s_axis_data_tready		(w_fir3_tready),
		.s_axis_data_tdata		(w_fifo2_tdata),
		.m_axis_data_tvalid		(w_fir3_tvalid),
		.m_axis_data_tdata		(w_fir3_tdata)
	);

	axis_data_fifo fifo3 (
		.s_axis_aresetn		(w_locked),
		.s_axis_aclk		(w_fir_ck),
		.s_axis_tvalid		(w_fir3_tvalid),
		.s_axis_tready		(),
		.s_axis_tdata		(w_fir3_tdata),
		.m_axis_tvalid		(w_fifo3_tvalid),
		.m_axis_tready		(w_fir4_tready),
		.m_axis_tdata		(w_fifo3_tdata)
	);

	// fs(in) = 120kHz, fs(out) = 48kHz, fc = 15kHz
	fir_2_over_5_0625 fir4 (
		.aclk					(w_fir_ck),
		.s_axis_data_tvalid		(w_fifo3_tvalid),
		.s_axis_data_tready		(w_fir4_tready),
		.s_axis_data_tdata		(w_fifo3_tdata),
		.m_axis_data_tvalid		(w_fir4_tvalid),
		.m_axis_data_tdata		(w_fir4_tdata)
	);

	axis_data_fifo_async fifo4 (
		.s_axis_aresetn			(w_locked),
		.m_axis_aresetn			(w_locked),
		.s_axis_aclk			(w_fir_ck),
		.s_axis_tvalid			(w_fir4_tvalid),
		.s_axis_tready			(),
		.s_axis_tdata			(w_fir4_tdata),
		.m_axis_aclk			(w_adck),
		.m_axis_tvalid			(w_fifo4_tvalid),
		.m_axis_tready			(1'b1),
		.m_axis_tdata			(w_fifo4_tdata)
	);

	de_emphasis de_emphasis_i (
		.clk					(w_adck),
		.d_in					(w_fifo4_tdata),
		.d_in_valid				(w_fifo4_tvalid),
		.d_out					(w_result_data),
		.d_out_valid			(w_result_valid)
	);

	// input to DMA FIFO
	always @(posedge w_adck) begin
		r_sw0	<=	{r_sw0[1:0], SW[0]};		// sync

		if (r_cnt >= 8'd4)		// 0-4
			r_cnt	<=	8'd0;
		else
			r_cnt	<=	r_cnt + 8'd1;

		if (r_sw0[2] && w_result_valid)
			r_axis_tvalid	<=	1'b1;
		else if (!r_sw0[2] && r_cnt == 8'd4)		// each 5 clocks (40/5=8MHz)
			r_axis_tvalid	<=	1'b1;
		else
			r_axis_tvalid	<=	1'b0;

		if (r_sw0[2])
			r_axis_data		<=	{32'b0, w_result_data};
		else
			case (r_cnt)
				8'd0:		// sample every 5 clocks (= 40MHz)
					r_axis_data	<=	{4'd0, r_axis_data[59:12], w_ad[11:0]};
				8'd1:
					r_axis_data	<=	{4'd0, r_axis_data[59:24], w_ad[11:0], r_axis_data[11:0]};
				8'd2:
					r_axis_data	<=	{4'd0, r_axis_data[59:36], w_ad[11:0], r_axis_data[23:0]};
				8'd3:
					r_axis_data	<=	{4'd0, r_axis_data[59:48], w_ad[11:0], r_axis_data[35:0]};
				8'd4:
					r_axis_data	<=	{4'd0, w_ad[11:0], r_axis_data[47:0]};
				default:
					r_axis_data	<=	r_axis_data;
			endcase
	end

  IOBUF iic_0_scl_iobuf
       (.I	(iic_0_scl_o),
        .IO	(I2C0_SCL),
        .O	(iic_0_scl_i),
        .T	(iic_0_scl_t));
  IOBUF iic_0_sda_iobuf
       (.I	(iic_0_sda_o),
        .IO	(I2C0_SDA),
        .O	(iic_0_sda_i),
        .T	(iic_0_sda_t));

  IOBUF iic_1_scl_iobuf
       (.I	(iic_1_scl_o),
        .IO	(I2C1_SCL),
        .O	(iic_1_scl_i),
        .T	(iic_1_scl_t));
  IOBUF iic_1_sda_iobuf
       (.I	(iic_1_sda_o),
        .IO	(I2C1_SDA),
        .O	(iic_1_sda_i),
        .T	(iic_1_sda_t));

endmodule

