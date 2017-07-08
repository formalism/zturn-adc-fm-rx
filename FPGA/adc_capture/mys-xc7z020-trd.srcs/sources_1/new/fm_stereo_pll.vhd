library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity fm_stereo_pll is
	port (
		clk			:	in	std_logic;
		en			:	in	std_logic;
		atan_diff	:	in	std_logic_vector(31 downto 0);

		sin38khz	:	out	std_logic_vector(11 downto 0)
	);
end fm_stereo_pll;

architecture STRUCTURE of fm_stereo_pll is
	signal	r_pinc			:	std_logic_vector(20 downto 0)	:=	'0' & X"1374B";		-- nearly 19kHz
	signal	r_config_tvalid	:	std_logic						:=	'0';
	signal	w_data			:	std_logic_vector(31 downto 0);
	signal	w_sin			:	std_logic_vector(9 downto 0);
	signal	w_cos			:	std_logic_vector(9 downto 0);
	signal	w_dds_tvalid	:	std_logic;
	signal	w_fir_tready	:	std_logic;
	signal	r_en			:	std_logic;

	signal	r_mul			:	std_logic_vector(41 downto 0);
	signal	w_fir_tdata_in	:	std_logic_vector(23 downto 0);
	signal	w_fir_tdata_out	:	std_logic_vector(31 downto 0);
	signal	w_fir_tvalid	:	std_logic;

	signal	r_sum			:	std_logic_vector(31 downto 0)	:=	(others => '0');

begin

	w_sin			<=		w_data(25 downto 16);
	w_cos			<=		w_data(9 downto 0);

	dds_i		:	entity work.dds_fm_pilot 
	port map (
		aclk					=>		clk,
		s_axis_config_tvalid	=>		r_config_tvalid,
		s_axis_config_tdata		=>		"000" & r_pinc,
		m_axis_data_tvalid		=>		w_dds_tvalid,
		m_axis_data_tready		=>		en,
		m_axis_data_tdata		=>		w_data,
		m_axis_phase_tvalid		=>		open,
		m_axis_phase_tready		=>		en,
		m_axis_phase_tdata		=>		open
	);

	-- mixer
	process (clk) begin
		if (rising_edge(clk)) then
			if (en = '1') then
				r_mul		<=	atan_diff * w_cos;
			else
				r_mul		<=	r_mul;
			end if;

			r_en		<=	en;
		end if;
	end process;

	w_fir_tdata_in		<=	r_mul(41 downto 18);		-- TODO

	-- 500kHz * 0.04 = 20kHz
	fir_i	:	entity work.fir_lpf_20khz 
	port map (
		aclk				=>		clk,
		s_axis_data_tvalid	=>		r_en,
		s_axis_data_tready	=>		w_fir_tready,
		s_axis_data_tdata	=>		w_fir_tdata_in,		-- 24 bit
		m_axis_data_tvalid	=>		w_fir_tvalid,
		m_axis_data_tdata	=>		w_fir_tdata_out
	);

	process (clk) begin
		if (rising_edge(clk)) then
			if (w_fir_tvalid = '1') then
				r_sum	<=	r_sum + w_fir_tdata_out;
			else
				r_sum	<=	r_sum;
			end if;
		end if;
	end process;

end STRUCTURE;

