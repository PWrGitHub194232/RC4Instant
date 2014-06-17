----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:31 06/16/2014 
-- Design Name: 
-- Module Name:    ram_block - Behavioral 
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

entity ram_block is
    Port ( clock : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (7 downto 0);
           address : in  STD_LOGIC_VECTOR (7 downto 0);
           data_read : in  STD_LOGIC;
           data_write : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end ram_block;

architecture Behavioral of ram_block is

	type ram_table is array (0 to (2**address'length)-1) of std_logic_vector(data'range);
	signal ram : ram_table;

begin

	ram_process: process(clock) is
	begin
	if(reset='0') then
		if(data_write='1') then
			ram(to_integer(unsigned(address))) <= data;			
		end if;
		if(data_read='1') then
			output <= ram(to_integer(unsigned(address)));
		end if;
	else
		ram(to_integer(unsigned(address))) <= address;
	end if;
	end process ram_process;
	
end Behavioral;
