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

entity tom_component is
	generic (key_size : natural := 127;
				word_size : natural := 8);
    Port (
			  key_input_Kbox : in  STD_LOGIC_VECTOR (key_size downto 0);
           key_read_Kbox : in  STD_LOGIC;
           key_write_Kbox : in  STD_LOGIC;
			  clock_Kbox : in  STD_LOGIC;
           reset_Kbox : in  STD_LOGIC;
			  key_sel_Mux : in  STD_LOGIC;
			  clock_Sbox : in  STD_LOGIC;
           reset_Sbox : in  STD_LOGIC;
           i_read_Sbox : in  STD_LOGIC;
           i_write_Sbox : in  STD_LOGIC;
           j_read_Sbox : in  STD_LOGIC;
           j_write_Sbox : in  STD_LOGIC;
           t_read_Sbox : in  STD_LOGIC;
           t_write_Sbox : in  STD_LOGIC;
           counter_i_Sbox : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_Sj_Sbox : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_j_Sbox : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_Si_Sbox : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_t_Sbox : in  STD_LOGIC_VECTOR (7 downto 0);
           stream : out  STD_LOGIC_VECTOR (7 downto 0);
end s_box;

architecture Behavioral of s_box is

component ram_block is
    Port ( clock : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (7 downto 0);
           address : in  STD_LOGIC_VECTOR (7 downto 0);
           data_read : in  STD_LOGIC;
           data_write : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;


begin

ram_i : ram_block
port map (
	clock => clock,
	data => counter_i,
	address => counter_Si,
	data_read => i_read,
	data_write => i_write,
	reset => reset,
	output => out_i
);

ram_j : ram_block
port map (
	clock => clock,
	data => counter_j,
	address => counter_Sj,
	data_read => j_read,
	data_write => j_write,
	reset => reset,
	output => out_j
);

ram_t : ram_block
port map (
	clock => clock,
	data => counter_i, --BDNE ALE NIE WIEM GDZIE TO PODPI PKI CO
	address => counter_t,
	data_read => t_read,
	data_write => t_write,
	reset => reset,
	output => out_t
);

end Behavioral;

