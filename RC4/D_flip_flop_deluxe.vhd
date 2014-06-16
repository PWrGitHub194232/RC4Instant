----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:16 06/16/2014 
-- Design Name: 
-- Module Name:    D_flip_flop_deluxe - Behavioral 
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

entity D_flip_flop_deluxe is
	generic (
		word_size : natural := 8);
	Port ( 
		D : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
		clock : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		enable : in  STD_LOGIC;
		Q : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end D_flip_flop_deluxe;

architecture Behavioral of D_flip_flop_deluxe is

begin
	dffd_process: process (clock) is
	begin
		if enable='0' then 
			null;
		elsif rising_edge(clock) then
			Q <= D;
		end if;
	end process;
	
end Behavioral;