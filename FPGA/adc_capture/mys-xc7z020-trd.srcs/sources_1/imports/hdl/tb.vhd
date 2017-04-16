library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
library STD;
use STD.textio.all;

entity tb is
end tb;

architecture SIM of tb is

	signal	w_adck		:	std_logic;
	signal	w_i_cic_en	:	std_logic;
	signal	w_q_cic_en	:	std_logic;
	signal	w_i_cic		:	std_logic_vector(28 downto 0);
	signal	w_q_cic		:	std_logic_vector(28 downto 0);
	signal	w_ad		:	std_logic_vector(11 downto 0);
	signal	w_i			:	std_logic_vector(13 downto 0);
	signal	w_q			:	std_logic_vector(13 downto 0);

	signal	w_bram_adr	:	std_logic_vector(31 downto 0);
	signal	w_bram_dout	:	std_logic_vector(31 downto 0);

	file fd				:	text open read_mode is "adc_fm.txt";

begin

	bram_i	:	entity work.bram port map (
		clk		=>		w_adck,
		adr		=>		w_bram_adr,
		data	=>		w_bram_dout
	);

	mixer_i	:	entity work.mixer port map (
		clk			=>	w_adck,
		bram_adr	=>	w_bram_adr,
		bram_data	=>	w_bram_dout,
		data		=>	w_ad,
		i_out		=>	w_i,
		q_out		=>	w_q
	);

	cic_i	:	entity work.cic port map (
		clk		=>	w_adck,
		d_in	=>	w_i,
		en		=>	w_i_cic_en,
		d_out	=>	w_i_cic
	);
	cic_q	:	entity work.cic port map (
		clk		=>	w_adck,
		d_in	=>	w_q,
		en		=>	w_q_cic_en,
		d_out	=>	w_q_cic
	);

	process begin
		w_adck	<=	'0';
		wait for 10 ns;
		w_adck	<=	'1';
		wait for 10 ns;
	end process;

	process
		variable ln		:	line;
		variable r_ad	:	std_logic_vector(15 downto 0);
	begin
		while not endfile (fd) loop
			readline(fd, ln);
			hread(ln, r_ad);
			w_ad	<=	r_ad(11 downto 0);
			wait until w_adck'event and w_adck = '1';
		end loop;
	end process;
end SIM;

configuration SIM_CFG of tb is for SIM end for;
end SIM_CFG;

