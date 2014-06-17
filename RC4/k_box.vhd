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
	generic (
		key_size : natural := 127;
		word_size : natural := 8;
		s_box_size : natural := 8);
	Port ( 
		k_box_key_input : in  STD_LOGIC_VECTOR (key_size-1 downto 0);
		k_box_key_read : in  STD_LOGIC;
		k_box_key_write : in  STD_LOGIC;
		k_box_address : in  STD_LOGIC_VECTOR (s_box_size-1 downto 0);
		k_box_reset : in  STD_LOGIC;
		k_box_clk : in  STD_LOGIC;
		k_box_key_out : out  STD_LOGIC_VECTOR (word_size-1 downto 0));
end k_box;


architecture Behavioral of k_box is

	--type key_table is array (0 to key_size) of std_logic_vector(k_box_key_out'range);
	signal key : std_logic_vector(key_size-1 downto 0);

begin

	key_process: process(k_box_clk) is
	begin
		if(k_box_key_write='1') then
			key((to_integer(signed(k_box_address)) mod (key_size+1))) <= k_box_key_input((to_integer(signed(k_box_address)) mod (key_size+1)));		
		end if;
		if(k_box_key_read='1') then
			k_box_key_out(0) <= key((to_integer(signed(k_box_address))+0 mod (key_size+1)));
			k_box_key_out(1) <= key((to_integer(signed(k_box_address))+1 mod (key_size+1)));
			k_box_key_out(2) <= key((to_integer(signed(k_box_address))+2 mod (key_size+1)));
			k_box_key_out(3) <= key((to_integer(signed(k_box_address))+3 mod (key_size+1)));
			k_box_key_out(4) <= key((to_integer(signed(k_box_address))+4 mod (key_size+1)));
			k_box_key_out(5) <= key((to_integer(signed(k_box_address))+5 mod (key_size+1)));
			k_box_key_out(6) <= key((to_integer(signed(k_box_address))+6 mod (key_size+1)));
			k_box_key_out(7) <= key((to_integer(signed(k_box_address))+7 mod (key_size+1)));
		end if;
	end process key_process;

end Behavioral;