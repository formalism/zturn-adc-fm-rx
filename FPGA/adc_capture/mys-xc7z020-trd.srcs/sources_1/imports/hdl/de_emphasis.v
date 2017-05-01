module de_emphasis #(
	parameter signed[17:0]	DECAY	=	0.67523190665 * (2.0 ** 15),
	parameter signed[17:0]	DECAY_1	=	0.32476809335 * (2.0 ** 15)
) (
	input				clk,
	input signed[31:0]	d_in,
	input				d_in_valid,
	output signed[31:0]	d_out,
	output				d_out_valid
);

reg					r_d_in_valid, r_d_in_valid2, r_d_in_valid3;
reg signed[48:0]	r_tmp, r_term1, r_term2;		// 31+18 = 49bit
reg signed[31:0]	r_sum;

assign	d_out_valid		=	r_d_in_valid3;
assign	d_out			=	r_sum;

always @(posedge clk) begin
	r_d_in_valid		<=	d_in_valid;
	r_d_in_valid2		<=	r_d_in_valid;
	r_d_in_valid3		<=	r_d_in_valid2;

	if (d_in_valid) begin
		r_term1			<=	DECAY_1 * d_in;
		r_term2			<=	DECAY * r_sum;
	end else begin
		r_term1			<=	r_term1;
		r_term2			<=	r_term2;
	end
	
	if (r_d_in_valid)
		r_tmp			<=	r_term1 + r_term2;
	else
		r_tmp			<=	r_tmp;

	if (r_d_in_valid2)
		r_sum			<=	r_tmp[48:17];
	else
		r_sum			<=	r_sum;
end

endmodule

