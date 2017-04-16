module cic #(
	parameter	INPUT_WIDTH		=	14,
	parameter	OUTPUT_WIDTH	=	29,
	parameter	RATE_CHANGE		=	32
	)
(
	input							clk,
	input signed [INPUT_WIDTH-1:0]	d_in,		// continuous input
	output							en,
	input signed [OUTPUT_WIDTH-1:0] d_out		// intermittent output
);

// bit growth = N log2(RM), where N = # of stages, R = rate change, M = 1
// if N = 3, R = 32, then growth = 3*log2(32)=15 bits

reg signed [OUTPUT_WIDTH-1:0]	r_sum1, r_sum2, r_sum3;
reg signed [OUTPUT_WIDTH-1:0]	r_dif1, r_dif2, r_dif3;
reg signed [OUTPUT_WIDTH-1:0]	r_out;
reg signed [OUTPUT_WIDTH-1:0]	r_tmp;
reg								r_en;
reg [7:0]	r_cnt = 8'd0;

	assign	d_out	=	r_out;
	assign	en		=	r_en;

	always @(posedge clk) begin
		if (r_cnt >= RATE_CHANGE-1) begin
			r_en	<=	1'b1;
			r_cnt	<=	8'd0;
		end else begin
			r_en	<=	1'b0;
			r_cnt	<=	r_cnt + 8'd1;
		end

		r_sum1	<=	r_sum1 + d_in;
		r_sum2	<=	r_sum2 + r_sum1 + d_in;
		r_sum3	<=	r_sum3 + r_sum2 + r_sum1 + d_in;
		r_tmp	<=	r_sum3;

		if (r_cnt >= RATE_CHANGE-1) begin
			r_dif1	<=	r_tmp;
			r_dif2	<=	r_tmp - r_dif1;
			r_dif3	<=	r_tmp - r_dif1 - r_dif2;
			r_out	<=	r_tmp - r_dif1 - r_dif2 - r_dif3;
		end else begin
			r_dif1	<=	r_dif1;
			r_dif2	<=	r_dif2;
			r_dif3	<=	r_dif3;
			r_out	<=	r_out;
		end
	end // always @ (posedge clk)

   initial begin
	  r_sum1	<=		0;
	  r_sum2	<=		0;
	  r_sum3	<=		0;
	  r_dif1	<=		0;
	  r_dif2	<=		0;
	  r_dif3	<=		0;
	  r_out		<=		0;
	  r_tmp		<=		0;
   end

endmodule

