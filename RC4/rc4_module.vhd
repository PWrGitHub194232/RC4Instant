----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:42 06/17/2014 
-- Design Name: 
-- Module Name:    rc4_module - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc4_module is
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
		plainText : in STD_LOGIC_VECTOR (word_size-1 downto 0);
		encryptedText : out  STD_LOGIC_VECTOR (word_size-1 downto 0)
		);
end rc4_module;

architecture Behavioral of rc4_module is

begin


end Behavioral;

