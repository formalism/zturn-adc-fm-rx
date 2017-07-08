library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
library STD;
use STD.textio.all;

entity fm_stereo_pll_tb is
end fm_stereo_pll_tb;

architecture SIM of fm_stereo_pll_tb is

	signal	clk			:	std_logic	:=	'0';
	signal	dat			:	std_logic_vector(31 downto 0);
	signal	en			:	std_logic;
	signal	cnt			:	std_logic_vector(7 downto 0)	:=	X"00";
	file fd				:	text open read_mode is "fm_demod.txt";

	component fm_stereo_pll is
		port (
			clk			:	in	std_logic;
			en			:	in	std_logic;
			atan_diff	:	in	std_logic_vector(31 downto 0);
			sin38khz	:	out	std_logic_vector(11 downto 0)
		);
	end component;

begin

	dut	:	fm_stereo_pll port map (
		clk			=>		clk,
		en			=>		en,
		atan_diff	=>		dat,
		sin38khz	=>		open
	);

	en		<=		'1' when cnt = 40 else '0';

	process begin
		clk		<=	'0';
		wait for 10 ns;
		clk		<=	'1';
		wait for 10 ns;
	end process;

	process (clk) begin
		if (rising_edge(clk)) then
			if (cnt >= 79) then
				cnt	<=	(others => '0');
			else
				cnt	<=	cnt + 1;
			end if;
		end if;
	end process;

	process
		variable ln		:	line;
		variable tmp	:	std_logic_vector(31 downto 0);
	begin
		while not endfile (fd) loop
			readline(fd, ln);
			hread(ln, tmp);
			dat	<=	tmp;
			wait until clk'event and clk = '1' and en = '1';
		end loop;
	end process;
end SIM;

configuration SIM_CFG of fm_stereo_pll_tb is for SIM end for;
end SIM_CFG;

