module de_emphasis_tb ();

	parameter CLK_PERIOD = 20;
   
	reg					w_adck = 1'b0;

	reg signed[31:0]	d_in = 32'h1234_5678;
	reg					d_in_valid = 1'b0;
	wire signed[31:0]	d_out;
	wire				d_out_valid;

	integer				i;
  
	always #(CLK_PERIOD/2)
		w_adck		<=		!w_adck;

	de_emphasis dut (
		.clk				(w_adck),
		.d_in				(d_in),
		.d_in_valid			(d_in_valid),
		.d_out				(d_out),
		.d_out_valid		(d_out_valid)
	);

   initial begin
		@(posedge w_adck);

		d_in_valid	<=	1'b1;

		@(posedge w_adck);

		d_in_valid	<=	1'b0;

		for (i = 0; i < 5; i = i + 1) begin
			@(posedge w_adck);
		end

		d_in_valid	<=	1'b1;
		d_in		<=	32'h5711_1753;

		@(posedge w_adck);

		d_in_valid	<=	1'b0;
		
		for (i = 0; i < 5; i = i + 1) begin
			@(posedge w_adck);
		end

		d_in_valid	<=	1'b1;
		d_in		<=	32'h0555_5555;

		@(posedge w_adck);

		d_in_valid	<=	1'b0;
		
		for (i = 0; i < 5; i = i + 1) begin
			@(posedge w_adck);
		end

		d_in_valid	<=	1'b1;
		d_in		<=	32'hFE81_5135;

		@(posedge w_adck);

		d_in_valid	<=	1'b0;

		for (i = 0; i < 5; i = i + 1) begin
			@(posedge w_adck);
		end

		$stop;
   end
   
endmodule // tb
