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

	wire[63:0]	w_gpio_tri_t;
	wire[63:0]	w_gpio_tri_o;
	wire		w_clk40m;
	wire		w_tready, w_tvalid;
	wire[15:0]	w_sin3mhz, w_sin11mhz;
	reg[63:0]	r_axis_data;
	reg[2:0]	r_cnt5;
	reg[2:0]	r_sw0;
(* keep = "true" *)	wire signed[11:0]	w_ad, w_ad2;
	wire		w_ofa, w_ofa2;
	wire		w_adck;
(* keep = "true" *)	wire signed[13:0]	w_i, w_q;

	wire w_i_cic_en, w_q_cic_en;
	wire signed [28:0]	w_i_cic, w_q_cic;

	wire[31:0]	w_bram_adr, w_bram_dout;
	reg			r_axis_tvalid;

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

		.s_axis_aclk				(w_adck),
		.s_axis_aresetn				(1'b1),
		.S_AXIS_tdata				(r_axis_data),
		.S_AXIS_tready				(w_tready),
		.S_AXIS_tvalid				(r_axis_tvalid),

		.M_AXIS_DATA_3MHZ_tdata		(w_sin3mhz),
		.M_AXIS_DATA_3MHZ_tvalid	(),
		.M_AXIS_DATA_11MHZ_tdata	(w_sin11mhz),
		.M_AXIS_DATA_11MHZ_tvalid	(),

		.BRAM_PORTB_addr			(w_bram_adr),
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
		.i_out						(w_i),		// 14bit
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

	always @(posedge w_adck) begin
		r_sw0	<=	{r_sw0[1:0], SW[0]};		// sync

		if (r_cnt5 >= 3'd4)		// 0-4
			r_cnt5	<=	3'd0;
		else
			r_cnt5	<=	r_cnt5 + 3'd1;

		if (r_sw0[2] && w_i_cic_en && w_q_cic_en)	//  when CIC output is prepared
			r_axis_tvalid	<=	1'b1;
		else if (!r_sw0[2] && r_cnt5 == 3'd4)		// each 5 clocks
			r_axis_tvalid	<=	1'b1;
		else
			r_axis_tvalid	<=	1'b0;

		if (r_sw0[2])
			r_axis_data		<=	{{3{w_i_cic[28]}}, w_i_cic, {3{w_q_cic[28]}}, w_q_cic};
		else
			case (r_cnt5)
				3'd0:
					r_axis_data	<=	{4'd0, r_axis_data[59:12], w_ad[11:0]};
				3'd1:
					r_axis_data	<=	{4'd0, r_axis_data[59:24], w_ad[11:0], r_axis_data[11:0]};
				3'd2:
					r_axis_data	<=	{4'd0, r_axis_data[59:36], w_ad[11:0], r_axis_data[23:0]};
				3'd3:
					r_axis_data	<=	{4'd0, r_axis_data[59:48], w_ad[11:0], r_axis_data[35:0]};
				3'd4:
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
endmodule

