----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:46 06/17/2014 
-- Design Name: 
-- Module Name:    xor - Behavioral 
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

entity Xxor is
	generic(
		word_size	: integer:=8);
	port(	
		clk			: in std_logic;
		chipherText	: in std_logic_vector(word_size-1 downto 0);
		plainText 	: in std_logic_vector(word_size-1 downto 0);
		output		: out std_logic_vector(word_size-1 downto 0));
end Xxor;

architecture Behavioral of Xxor is

begin
	output <= chipherText xor plainText;
end Behavioral;