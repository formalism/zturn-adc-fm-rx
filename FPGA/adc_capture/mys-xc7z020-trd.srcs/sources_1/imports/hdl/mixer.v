
module mixer
	#(
		parameter RESET_CNT			=	400,
		parameter SINUSOIDAL_WIDTH	=	13,		// 1Q11
		parameter DATA_WIDTH		=	12	
	)
(
	input								clk,
	output[31:0]						bram_adr,
	input[31:0]							bram_data,
	input signed[DATA_WIDTH-1:0]		data,
	output signed[DATA_WIDTH+2-1:0]		i_out,
	output signed[DATA_WIDTH+2-1:0]		q_out
);

reg[31:0]										r_cnt = 32'b0;
wire signed [SINUSOIDAL_WIDTH-1:0]				w_sin, w_cos;
reg signed [SINUSOIDAL_WIDTH+DATA_WIDTH-2:0]	r_i, r_q;

	assign	bram_adr	=	r_cnt;
	assign	w_sin		=	bram_data[SINUSOIDAL_WIDTH+16-1:16];	// b16 and upper
	assign	w_cos		=	bram_data[SINUSOIDAL_WIDTH-1:0];		// b0 and upper

	assign	i_out		=	r_i[SINUSOIDAL_WIDTH+DATA_WIDTH-2:SINUSOIDAL_WIDTH-3];
	assign	q_out		=	r_q[SINUSOIDAL_WIDTH+DATA_WIDTH-2:SINUSOIDAL_WIDTH-3];

	always @(posedge clk) begin
		if (r_cnt >= RESET_CNT-1)
			r_cnt	<=	32'd0;
		else
			r_cnt	<=	r_cnt + 32'd1;

		r_i		<=	data * w_sin;
		r_q		<=	data * w_cos;
	end

   initial begin
	  r_i		<=		0;
	  r_q		<=		0;
   end

endmodule
