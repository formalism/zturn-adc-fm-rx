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
	inout				I2C_SCL_B,			// rev0.2 board
	inout				I2C_SDA_B,

	// CN1
	input				ADC_CK,
	input signed[11:0]	AD,
	input				OFA,
	output				MUX,
	output				SHDNA,
	output				SHDNB,

	// CN2
	input				ADC_CK_B,
	input signed[11:0]	AD_B,
	input				OFA_B,
	output				MUX_B,
	output				SHDNA_B,
	output				SHDNB_B,

	// I2S CN1
	output				I2S_FS,
	output				I2S_BCLK,
	output				I2S_DAT,
	output				DAC_MCLK,

	// I2S CN2
	output				I2S_FS_B,
	output				I2S_BCLK_B,
	output				I2S_DAT_B,
	output				DAC_MCLK_B,

	// common
	output[2:2]			LEDS,
	input[3:0]			SW,
	output				BP
);

	parameter signed[33:0] PI = (2.0 ** 29.0) * 3.1415926535897932384626433832795;
	parameter signed[33:0] PI2 = (2.0 ** 30.0) * 3.1415926535897932384626433832795;

	wire[63:0]	w_gpio_tri_t;
	wire[63:0]	w_gpio_tri_o;
	wire		w_clk40m, w_mclk, w_locked2;
	wire		w_tready, w_tvalid;
	wire[15:0]	w_sin3mhz, w_sin11mhz;
	reg[63:0]	r_axis_data;
	reg[7:0]	r_cnt;
	reg[2:0]	r_sw0, r_sw3;
	reg			r_changed = 1'b1;
	reg[2:0]	r_sw2;
	wire signed[11:0]	w_ad_a, w_ad_a2, w_ad_b, w_ad_b2, w_ad, w_ad2;
	wire		w_ofa_a, w_ofa_a2, w_ofa_b, w_ofa_b2;
	wire		w_adc_ck_bufg, w_adc_ck_b_bufg;
	wire		w_adck, w_fir_ck, w_locked, w_i2s_bclk;
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

	wire[31:0]			w_i2s_data;
	wire				w_i2s_tready;
	wire				w_i2s_fs, w_i2s_dat;

	wire				iic_1_scl_o, iic_1_scl_i, iic_1_scl_t, iic_1_sda_o, iic_1_sda_i, iic_1_sda_t;
	wire				iic1_scl_i_a, iic1_sda_i_a, iic1_scl_i_b, iic1_sda_i_b;

	assign	LEDS[2:2]	=	w_locked & w_locked2;
	assign	BP			=	1'b0;

	assign	SHDNA		=	1'b0;
	assign	SHDNB		=	1'b0;
	assign	SHDNA_B		=	1'b0;
	assign	SHDNB_B		=	1'b0;
	assign	MUX			=	SW[1];	// 2-7, High->Ch A, Low->Ch B
	assign	MUX_B		=	SW[1];

	BUFG bufg_inst_a (
		.I		(ADC_CK),
		.O		(w_adc_ck_bufg)
	);
	BUFG bufg_inst_b (
		.I		(ADC_CK_B),
		.O		(w_adc_ck_b_bufg)
	);

	BUFGCTRL bufg_inst (		// use as asynchronous MUX
		.IGNORE0	(1'b1),
		.IGNORE1	(1'b1),
		.CE0		(1'b1),
		.CE1		(1'b1),
		.S0			(!SW[2]),
		.S1			(SW[2]),
		.I1			(w_adc_ck_bufg),
		.I0			(w_adc_ck_b_bufg),
		.O			(w_adck)
	);

	// 12.288MHz (=256*48kHz)
	gen_dac_mclk gen_dac_mclk_i (
		.reset			(r_changed),
		.clk_in1		(w_adck),
		.clk_out1		(w_mclk),
		.locked			(w_locked2)
	);
	assign		DAC_MCLK		=	w_mclk;
	assign		DAC_MCLK_B		=	w_mclk;
	assign		I2S_BCLK		=	w_i2s_bclk;
	assign		I2S_BCLK_B		=	w_i2s_bclk;
	assign		I2S_FS			=	w_i2s_fs;
	assign		I2S_FS_B		=	w_i2s_fs;
	assign		I2S_DAT			=	w_i2s_dat;
	assign		I2S_DAT_B		=	w_i2s_dat;

	i2s_tx i2s_tx_i (
		.mclk			(w_mclk),
		.bclk			(w_i2s_bclk),
		.d_ready		(w_i2s_tready),
		.l_in			(w_i2s_data[25:2]),
		.r_in			(w_i2s_data[25:2]),
		.fs				(w_i2s_fs),
		.dat			(w_i2s_dat)
	);

	generate
		genvar i;

		// CN1
		for (i = 0; i < 12; i = i + 1) begin
		IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_inst 
		(
			.R		(1'b0),
			.C		(w_adc_ck_bufg),
			.CE		(1'b1),
			.D		(AD[i]),
			.Q1		(w_ad_a[i]),
			.Q2		(w_ad_a2[i])
		); end

		// CN2
		for (i = 0; i < 12; i = i + 1) begin
		IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_inst_b 
		(
			.R		(1'b0),
			.C		(w_adc_ck_b_bufg),
			.CE		(1'b1),
			.D		(AD_B[i]),
			.Q1		(w_ad_b[i]),
			.Q2		(w_ad_b2[i])
		); end
	endgenerate;

	IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_ofa (
		.R		(1'b0),
		.C		(w_adc_ck_bufg),
		.CE		(1'b1),
		.D		(OFA),
		.Q1		(w_ofa_a),
		.Q2		(w_ofa_a2)
	);
	IDDR #(.DDR_CLK_EDGE ("SAME_EDGE_PIPELINED")) iddr_ofa_b (
		.R		(1'b0),
		.C		(w_adc_ck_b_bufg),
		.CE		(1'b1),
		.D		(OFA_B),
		.Q1		(w_ofa_b),
		.Q2		(w_ofa_b2)
	);
	assign	w_ad	=	SW[2] ? w_ad_a : w_ad_b;
	assign	w_ad2	=	SW[2] ? w_ad_a2 : w_ad_b2;

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

	// Fs(in)=40MHz, Fs(out)=1.25MHz
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
		.reset						(r_changed),
		.locked						(w_locked)
	);

	// Fs(in)=1.25MHz, Fs(out)=500kHz, Fc=200kHz
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

	// Fs=500kHz
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
		if (w_atan_tvalid) begin		// Fs=500kHz
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

	axis_data_fifo_async fifo_dac (
		.s_axis_aresetn			(w_locked),
		.m_axis_aresetn			(w_locked2),
		.s_axis_aclk			(w_adck),
		.s_axis_tvalid			(w_result_valid),
		.s_axis_tready			(),
		.s_axis_tdata			(w_result_data),
		.m_axis_aclk			(w_mclk),
		.m_axis_tvalid			(),
		.m_axis_tready			(w_i2s_tready),
		.m_axis_tdata			(w_i2s_data)
	);

	always @(posedge w_clk40m) begin
		r_sw2	<=	{r_sw2[1:0], SW[2]};
		if (r_sw2[2] != r_sw2[1])
			r_changed	<=	1'b1;
		else
			r_changed	<=	1'b0;
	end

	// input to DMA FIFO
	always @(posedge w_adck) begin
		r_sw0	<=	{r_sw0[1:0], SW[0]};		// sync
		r_sw3	<=	{r_sw3[1:0], SW[3]};		// sync

		if (r_cnt >= 8'd4)		// 0-4
			r_cnt	<=	8'd0;
		else
			r_cnt	<=	r_cnt + 8'd1;

		if (r_sw0[2] && r_sw3[2] && w_result_valid)	// audio signal
			r_axis_tvalid	<=	1'b1;
		else if (!r_sw3[2] && w_atan_tvalid)		// FM demodulated signal
			r_axis_tvalid	<=	1'b1;
		else if (!r_sw0[2] && r_cnt == 8'd4)		// each 5 clocks (40/5=8MHz)
			r_axis_tvalid	<=	1'b1;
		else
			r_axis_tvalid	<=	1'b0;

		if (r_sw0[2] && r_sw3[2])
			r_axis_data		<=	{32'b0, w_result_data};
		else if (!r_sw3[2])
			r_axis_data		<=	{32'b0, r_atan_diff};
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
        .O	(iic1_scl_i_a),
        .T	(iic_1_scl_t));
  IOBUF iic_1_sda_iobuf
       (.I	(iic_1_sda_o),
        .IO	(I2C1_SDA),
        .O	(iic1_sda_i_a),
        .T	(iic_1_sda_t));

	// CN2
  IOBUF iic_1_scl_iobuf_b
       (.I	(iic_1_scl_o),
        .IO	(I2C_SCL_B),
        .O	(iic1_scl_i_b),
        .T	(iic_1_scl_t));
  IOBUF iic_1_sda_iobuf_b
       (.I	(iic_1_sda_o),
        .IO	(I2C_SDA_B),
        .O	(iic1_sda_i_b),
        .T	(iic_1_sda_t));

	assign	iic_1_scl_i	=	SW[2] ? iic1_scl_i_a : iic1_scl_i_b;
	assign	iic_1_sda_i	=	SW[2] ? iic1_sda_i_a : iic1_sda_i_b;

endmodule

