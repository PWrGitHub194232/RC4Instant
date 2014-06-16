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
    Port ( val : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end D_flip_flop_deluxe;

architecture Behavioral of D_flip_flop_deluxe is

begin
		dffd_process: process (D,clock) is
		begin
		if(rising_edge(clk)) then
			if reset='0' then
				if enable='1' then
					output <= val;
				end if;
			else
				output <= '0';
			end if;
		end if;
	end process; 

end Behavioral;

