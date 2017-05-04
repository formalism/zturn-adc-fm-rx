module i2s_tx_tb ();

	parameter CLK_PERIOD = 20;
   
	reg			mclk = 1'b0;
	wire		bclk, d_ready, fs, dat;
	reg[23:0]	l_in, r_in;

	integer		i;
  
	always #(CLK_PERIOD/2)
		mclk		<=		!mclk;

	i2s_tx dut (
		.mclk		(mclk),
		.bclk		(bclk),
		.d_ready	(d_ready),
		.l_in		(l_in),
		.r_in		(r_in),
		.fs			(fs),
		.dat		(dat)
	);

   initial begin
		l_in		<=	24'h87_65_43;
		r_in		<=	24'hCB_A9_87;

		while (!d_ready) begin
			@(posedge mclk);
		end

		l_in		<=	24'h12_34_56;
		r_in		<=	24'h98_76_54;
		
		for (i = 0; i < 4096; i = i + 1) begin
			@(posedge mclk);
		end

		$stop;
   end
   
endmodule // tb
