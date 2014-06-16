----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:24 06/16/2014 
-- Design Name: 
-- Module Name:    D_flip_flop - Behavioral 
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

entity D_flip_flop is
	Port ( clock : in STD_LOGIC;
			D : in  STD_LOGIC_VECTOR (7 downto 0);
			Q : out STD_LOGIC_VECTOR (7 downto 0));
end D_flip_flop;

architecture Behavioral of D_flip_flop is

begin
	dff_process: process (D,clock) is

	begin
		if clock = '1' then
			Q <= D ;
		end if;
	end process; 

end Behavioral;

