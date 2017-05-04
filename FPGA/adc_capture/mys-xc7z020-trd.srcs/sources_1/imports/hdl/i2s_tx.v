module i2s_tx (
	input				mclk,		// 256fs
	output				bclk,		// 64fs
	output				d_ready,	// data ack for l(r)_in
	input [23:0]		l_in,
	input [23:0]		r_in,
	output				fs,
	output				dat
);

reg[7:0]	r_mclk_cnt = 8'd0;
reg[7:0]	r_bclk_cnt = 8'd0;
reg			r_fs = 1'b1;
reg[23:0]	r_l, r_r;
reg			r_bclk = 1'b0;

	assign	fs		=	r_fs;
	assign	dat		=	(r_bclk_cnt <= 8'd31) ? r_l[23] : r_r[23];
	assign	d_ready	=	r_mclk_cnt == 8'h00;
	assign	bclk	=	r_bclk;

always @(posedge mclk) begin
	r_mclk_cnt	<=	r_mclk_cnt + 8'd1;		// 0-255

	if (r_mclk_cnt >= 8'hFF) 
		r_l			<=	l_in;
	else if (r_bclk_cnt >= 8'd1 && r_mclk_cnt[1:0] == 2'b11) 
		r_l			<=	{r_l[22:0], 1'b0};
	else 
		r_l			<=	r_l;

	if (r_mclk_cnt >= 8'hFF) 
		r_r			<=	r_in;
	else if (r_bclk_cnt >= 8'd33 && r_mclk_cnt[1:0] == 2'b11) 
		r_r			<=	{r_r[22:0], 1'b0};
	else 
		r_r			<=	r_r;

	if (r_mclk_cnt >= 8'hFF)
		r_bclk_cnt	<=	8'd0;
	else if (r_mclk_cnt[1:0] == 2'b11)
		r_bclk_cnt	<=	r_bclk_cnt + 8'd1;
	else
		r_bclk_cnt	<=	r_bclk_cnt;

	if (r_mclk_cnt >= 8'hFF)
		r_fs		<=	1'b0;
	else if (r_mclk_cnt == 8'h7F)
		r_fs		<=	1'b1;
	else
		r_fs		<=	r_fs;

	if (r_mclk_cnt[1:0] == 2'b11)
		r_bclk		<=	1'b0;
	else if (r_mclk_cnt[1:0] == 2'b01)
		r_bclk		<=	1'b1;
	else
		r_bclk		<=	r_bclk;
end

endmodule

