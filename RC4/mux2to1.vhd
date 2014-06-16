----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:54 06/16/2014 
-- Design Name: 
-- Module Name:    mux2to1 - Behavioral 
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

entity mux is
	generic (
		word_size : natural := 8);
	port(
		mux_input_1 : in STD_LOGIC_VECTOR (word_size-1 downto 0);
		mux_input_2 : in STD_LOGIC_VECTOR (word_size-1 downto 0);
		mux_swith : in std_logic;
		mux_output : out STD_LOGIC_VECTOR (word_size-1 downto 0));
end mux;
 
architecture Behavioral of mux is
begin
	with mux_swith select mux_output <= 
		mux_input_1 when '0', 
		mux_input_2 when '1';
end Behavioral;

