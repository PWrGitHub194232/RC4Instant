----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:17 06/16/2014 
-- Design Name: 
-- Module Name:    k_box - Behavioral 
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

------------------------------------------------------------------------
-- k_box pobiera klucz danej długości key_size.
-- address jest dzielonym sygnałem razem z SBox'em.
--		Jeśli klucz jest mniejszy od rozmiarów SBox'a to robimy modulo.
-- Gdy key_write='1' to zapełniaj kolejne elementy tablicy key_table[address].
-- Gdy key_read='1' to wystawiaj klucz[address % (key_size+1)] - udajemy,
--		że tablica KBox'a jest równa rozmiarom SBox'a. Zatem powtarzamy klucz 
--		na wyjściu w razie potrzeby.

entity k_box is
	 generic (key_size : natural := 127;
				word_size : natural := 8);
    Port ( key_input : in  STD_LOGIC_VECTOR (key_size downto 0);
           key_read : in  STD_LOGIC;
           key_write : in  STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (word_size-1 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           key_out : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end k_box;

architecture Behavioral of k_box is

	type key_table is array (0 to key_size) of std_logic_vector(key_out'range);
	signal key : key_table;

begin

	key_process: process(clk) is
	begin
		if(key_write='1') then
			key((to_integer(signed(address)) mod (key_size+1))) <= key_input;		
		end if;
		if(key_read='1') then
			key_out <= key((to_integer(signed(address)) mod (key_size+1)));
		end if;
	end process key_process;

end Behavioral;