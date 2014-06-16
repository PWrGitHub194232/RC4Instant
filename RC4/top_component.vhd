----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:41 06/16/2014 
-- Design Name: 
-- Module Name:    s_box - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_component is
	generic (key_size : natural := 127;
		word_size : natural := 8;
		s_box_size : natural := 8);
	Port (
		clock : in  STD_LOGIC;
		key_input_Kbox : in  STD_LOGIC_VECTOR (key_size-1 downto 0);
		key_read_Kbox : in  STD_LOGIC;
		key_write_Kbox : in  STD_LOGIC;
		reset_Kbox : in  STD_LOGIC;
		key_sel_Mux : in  STD_LOGIC;
		reset_Sbox : in  STD_LOGIC;
		i_read_Sbox : in  STD_LOGIC;
		i_write_Sbox : in  STD_LOGIC;
		j_read_Sbox : in  STD_LOGIC;
		j_write_Sbox : in  STD_LOGIC;
		t_read_Sbox : in  STD_LOGIC;
		t_write_Sbox : in  STD_LOGIC;
		counter_i_Sbox_Kbox : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		counter_Sj_Sbox : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		counter_j_Sbox : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		counter_Si_Sbox : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		counter_t_Sbox : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		stream : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end top_component;

architecture Behavioral of top_component is

component k_box is
	Port ( 
		k_box_key_input : in  STD_LOGIC_VECTOR (key_size downto 0);
		k_box_key_read : in  STD_LOGIC;
		k_box_key_write : in  STD_LOGIC;
		k_box_address : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		k_box_reset : in  STD_LOGIC;
		k_box_clk : in  STD_LOGIC;
		k_box_key_out : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;

component mux is
	port(
		mux_input_1 : in std_logic;
		mux_input_2 : in std_logic;
		mux_swith : in std_logic;
		mux_output : out std_logic);
end component;

component adder is
	port(
		A : in std_logic_vector(word_size-1 downto 0);
		B : in std_logic_vector(word_size-1 downto 0);
		SUM : out std_logic_vector(word_size-1 downto 0));
end component;

component D_flip_flop is
	port(
		clock : in STD_LOGIC;
		D : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		Q : out STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;


component s_box is
	Port (
		s_box_clock : in  STD_LOGIC;
		s_box_reset : in  STD_LOGIC;
		s_box_i_read : in  STD_LOGIC;
		s_box_i_write : in  STD_LOGIC;
		s_box_j_read : in  STD_LOGIC;
		s_box_j_write : in  STD_LOGIC;
		s_box_t_read : in  STD_LOGIC;
		s_box_t_write : in  STD_LOGIC;
		s_box_counter_i : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		s_box_counter_Sj : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		s_box_counter_j : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		s_box_counter_Si : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		s_box_counter_t : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		s_box_out_Si : out  STD_LOGIC_VECTOR (word_size-1 downto 0);
		s_box_out_Sj : out  STD_LOGIC_VECTOR (word_size-1 downto 0);
		s_box_out_St : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;


signal empty : std_logic:='0';
signal k_box_key_mux : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

signal mux_adder_j_Kbox : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal adder_j_adder_Kbox_Sbox : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal adder_jKS_ffj : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal ffj_adder_jK : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal si_adder_jKS : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

begin


main_K_box : k_box
port map (
	k_box_key_input => key_input_Kbox,
	k_box_key_read => key_read_Kbox,
	k_box_key_write => key_write_Kbox,
	k_box_address => counter_i_Sbox_Kbox,
	k_box_reset => reset_Kbox,
	k_box_clk => clock,
	k_box_key_out => k_box_key_mux
);

main_mux : mux
port map (
	mux_input_1 => k_box_key_mux,
	mux_input_2 => empty,
	mux_swith => key_sel_Mux,
	mux_output => mux_adder_j_Kbox
);

adder_j_Kbox : adder
port map (
	A => ffj_adder_jK,
	B => mux_adder_j_Kbox,
	SUM => adder_j_adder_Kbox_Sbox
);

adder_j_Kbox_Sbox : adder
port map (
	A => adder_j_adder_Kbox_Sbox,
	B => si_adder_jKS,
	SUM => adder_jKS_ffj
);

ff_j : D_flip_flop
port map (
	clock => clock,
	D => adder_jKS_ffj,
	Q => ffj_adder_jK
);

main_S_box : s_box
port map (
	s_box_clock => clock,
	s_box_reset => reset_Sbox,
	s_box_i_read => i_read_Sbox,
	s_box_i_write => i_write_Sbox,
	s_box_j_read => j_read_Sbox,
	s_box_j_write => j_write_Sbox,
	s_box_t_read => t_read_Sbox,
	s_box_t_write => t_write_Sbox,
	s_box_counter_i => counter_i_Sbox_Kbox,
	s_box_counter_Sj => counter_Sj_Sbox,
	s_box_counter_j => counter_j_Sbox,
	s_box_counter_Si => counter_Si_Sbox,
	s_box_counter_t => counter_t_Sbox,
	s_box_out_Si => si_outSignal,
	s_box_out_Sj => sj_outSignal,
	s_box_out_St => stream
);

ff_Si : D_flip_flop
port map (
	clock => clock,
	D => si_outSignal,
	Q => counter_Sj_Sbox 
);

ff_Sj : D_flip_flop
port map (
	clock => clock,
	D => sj_outSignal,
	Q => counter_Si_Sbox
);

adder_Si_Sj : adder
port map (
	A => si_outSignal,
	B => sj_outSignal,
	SUM => adder_Si_Sj_fft
);

ff_t : D_flip_flop
port map (
	clock => clock,
	D => adder_Si_Sj_fft,
	Q => fft_Sboxt
);

end Behavioral;

