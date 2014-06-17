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

entity storage_unit is
	generic (key_size : natural := 127;
		word_size : natural := 8;
		s_box_size : natural := 8);
	Port (
		clock : in  STD_LOGIC;
		key_input_Kbox : in  STD_LOGIC;
		key_read_Kbox : in  STD_LOGIC;
		key_write_Kbox : in  STD_LOGIC;
		reset_Kbox : in  STD_LOGIC;
		key_sel_Mux : in  STD_LOGIC;
		reset_Sbox : in  STD_LOGIC;
		i_read_Sbox : in  STD_LOGIC;
		j_read_Sbox : in  STD_LOGIC;
		t_read_Sbox : in  STD_LOGIC;
		i_write_Sbox : in  STD_LOGIC;
		j_write_Sbox : in  STD_LOGIC;
		t_write_Sbox : in  STD_LOGIC;
		counter_i_Sbox_Kbox : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		j_enable : in  STD_LOGIC;
		j_reset : in  STD_LOGIC;
		t_enable : in  STD_LOGIC;
		t_reset : in  STD_LOGIC;
		inputPlainText : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		stream : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end storage_unit;

architecture Behavioral of storage_unit is

component k_box is
	Port ( 
		k_box_key_input : in  STD_LOGIC;
		k_box_key_read : in  STD_LOGIC;
		k_box_key_write : in  STD_LOGIC;
		k_box_address : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		k_box_reset : in  STD_LOGIC;
		k_box_clk : in  STD_LOGIC;
		k_box_key_out : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;

-- Kbox output signals
signal Kbox_key_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

-- Kbox input signals

component mux is
	port(
		mux_input_1 : in STD_LOGIC_VECTOR (word_size-1 downto 0);
		mux_input_2 : in STD_LOGIC_VECTOR (word_size-1 downto 0);
		mux_swith : in std_logic;
		mux_output : out STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;

-- MUX output signals
signal Mux_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

-- MUX input signals
signal Mux_empty_inSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

component adder is
	port(
		A : in std_logic_vector(word_size-1 downto 0);
		B : in std_logic_vector(word_size-1 downto 0);
		SUM : out std_logic_vector(word_size-1 downto 0));
end component;

-- ADDER output signals
--adder_jK
signal Add_jK_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
--adder_jKS
signal Add_jKS_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
--adder_Si_Sj
signal Add_Si_Sj_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');


component D_flip_flop is
	port(
		clock : in STD_LOGIC;
		D : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		Q : out STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;

-- DFF output signals
--ff_Si
signal DFF_Si_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
--ff_Sj
signal DFF_Sj_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');


component D_flip_flop_deluxe is
	generic (
		word_size : natural := 8);
	Port ( 
		D : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		clock : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		enable : in  STD_LOGIC;
		Q : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end component;

-- DFFD output signals
--ff_j
signal DFFD_j_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
--ff_t
signal DFFD_t_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');


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

-- Sbox output signals
signal Sbox_si_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal Sbox_sj_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');
signal Sbox_st_outSignal : STD_LOGIC_VECTOR (word_size-1 downto 0) := (others => '0');

-- Sbox input signals
--DFF_Si_outSignal -> Sj
--Add_jKS_outSignal -> j
--DFF_Sj_outSignal -> Si
-- DFFD_t_outSignal -> t

component Xxor is
	Port (
		clk			: in std_logic;
		chipherText	: in std_logic_vector(word_size-1 downto 0);
		plainText 	: in std_logic_vector(word_size-1 downto 0);
		output		: out std_logic_vector(word_size-1 downto 0));
end component;



begin


main_K_box : k_box
port map (
	k_box_key_input => key_input_Kbox,
	k_box_key_read => key_read_Kbox,
	k_box_key_write => key_write_Kbox,
	k_box_address => counter_i_Sbox_Kbox,
	k_box_reset => reset_Kbox,
	k_box_clk => clock,
	k_box_key_out => Kbox_key_outSignal
);

main_mux : mux
port map (
	mux_input_1 => Kbox_key_outSignal,
	mux_input_2 => Mux_empty_inSignal,
	mux_swith => key_sel_Mux,
	mux_output => Mux_outSignal
);

adder_j_Kbox : adder
port map (
	A => DFFD_j_outSignal,
	B => Mux_outSignal,
	SUM => Add_jK_outSignal
);

adder_jKS : adder
port map (
	A => Add_jK_outSignal,
	B => Sbox_si_outSignal,
	SUM => Add_jKS_outSignal
);

ff_j : D_flip_flop_deluxe
port map (
	D => Add_jKS_outSignal,
	clock => clock,
	reset => j_reset,
	enable => j_enable,
	Q => DFFD_j_outSignal
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
	s_box_counter_Sj => DFF_Si_outSignal,
	s_box_counter_j => Add_jKS_outSignal,
	s_box_counter_Si => DFF_Sj_outSignal,
	s_box_counter_t => DFFD_t_outSignal,
	s_box_out_Si => Sbox_si_outSignal,
	s_box_out_Sj => Sbox_sj_outSignal,
	s_box_out_St => Sbox_st_outSignal
);

ff_Si : D_flip_flop
port map (
	clock => clock,
	D => Sbox_si_outSignal,
	Q => DFF_Si_outSignal 
);

ff_Sj : D_flip_flop
port map (
	clock => clock,
	D => Sbox_sj_outSignal,
	Q => DFF_Sj_outSignal
);

adder_Si_Sj : adder
port map (
	A => Sbox_si_outSignal,
	B => Sbox_sj_outSignal,
	SUM => Add_Si_Sj_outSignal
);

ff_t : D_flip_flop_deluxe
port map (
	D => Add_Si_Sj_outSignal,
	clock => clock,
	reset => t_reset,
	enable => t_enable,
	Q => DFFD_t_outSignal
);

main_xor : Xxor
port map (
	clk => clock,
	chipherText => Sbox_st_outSignal,
	plainText => inputPlainText,
	output => stream
);

end Behavioral;