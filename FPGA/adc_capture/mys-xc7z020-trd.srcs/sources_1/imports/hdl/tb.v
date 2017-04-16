module tb ();

	parameter CLK_PERIOD = 20;
   
	reg					w_adck = 1'b0;
	wire				w_i_cic_en, w_q_cic_en;
	wire signed [28:0]	w_i_cic, w_q_cic;
	wire signed [11:0]	w_ad;
	reg signed[15:0]	r_tmp;
	reg signed[15:0]	r_ad = 16'd0;
	wire signed[13:0]	w_i, w_q;
   
	wire [31:0] 		w_bram_adr, w_bram_dout;
	integer				fd, status;
   
	always #(CLK_PERIOD/2)
		w_adck		<=		!w_adck;

	bram bram_i (
		.clk			(w_adck),
		.adr			(w_bram_adr),
		.data			(w_bram_dout)
	);
   
	mixer mixer_i (
		.clk			(w_adck),
		.bram_adr		(w_bram_adr),
		.bram_data		(w_bram_dout),
		.data			(w_ad),
		.i_out			(w_i),		// 14bit
		.q_out			(w_q)
	);

	cic cic_i (
		.clk			(w_adck),
		.d_in			(w_i),
		.en				(w_i_cic_en),
		.d_out			(w_i_cic)
	);
	cic cic_q (
		.clk			(w_adck),
		.d_in			(w_q),
		.en				(w_q_cic_en),
		.d_out			(w_q_cic)
	);

	assign	w_ad	=	r_ad[11:0];

   initial begin
		fd	=	$fopen("adc_fm.dat", "rb");
		while (!$feof(fd)) begin
			status = $fread(r_tmp, fd);
			r_ad	<=	r_tmp;
			@(posedge w_adck);
		end
			
		$stop;
   end
   
endmodule // tb
