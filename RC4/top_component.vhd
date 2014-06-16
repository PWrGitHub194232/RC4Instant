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
           counter_i_Sbox : in  STD_LOGIC_VECTOR (word_size downto 0);
           counter_Sj_Sbox : in  STD_LOGIC_VECTOR (word_size downto 0);
           counter_j_Sbox : in  STD_LOGIC_VECTOR (word_size downto 0);
           counter_Si_Sbox : in  STD_LOGIC_VECTOR (word_size downto 0);
           counter_t_Sbox : in  STD_LOGIC_VECTOR (word_size downto 0);
           stream : out  STD_LOGIC_VECTOR (word_size downto 0));
end top_component;

architecture Behavioral of top_component is

component s_box is
   Port ( s_box_clock : in  STD_LOGIC;
	  s_box_reset : in  STD_LOGIC;
	  s_box_i_read : in  STD_LOGIC;
	  s_box_i_write : in  STD_LOGIC;
	  s_box_j_read : in  STD_LOGIC;
	  s_box_j_write : in  STD_LOGIC;
	  s_box_t_read : in  STD_LOGIC;
	  s_box_t_write : in  STD_LOGIC;
	  s_box_counter_i : in  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_counter_Sj : in  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_counter_j : in  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_counter_Si : in  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_counter_t : in  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_out_i : out  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_out_j : out  STD_LOGIC_VECTOR (7 downto 0);
	  s_box_out_t : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


begin

main_S_box : s_box
port map (
	s_box_clock => clock_Sbox,
	s_box_reset => reset_Sbox,
	s_box_i_read => i_read_Sbox,
	s_box_i_write => i_write_Sbox,
	s_box_j_read => j_read_Sbox,
	s_box_j_write => j_write_Sbox,
	s_box_t_read => t_read_Sbox,
	s_box_t_write => t_write_Sbox,
	s_box_counter_i => counter_i_Sbox,
	s_box_counter_Sj => counter_Sj_Sbox,
	s_box_counter_j => counter_j_Sbox,
	s_box_counter_Si => counter_Si_Sbox,
	s_box_counter_t => counter_t_Sbox
);

end Behavioral;

