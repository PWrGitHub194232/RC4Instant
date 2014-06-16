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

entity s_box is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           i_read : in  STD_LOGIC;
           i_write : in  STD_LOGIC;
           j_read : in  STD_LOGIC;
           j_write : in  STD_LOGIC;
           t_read : in  STD_LOGIC;
           t_write : in  STD_LOGIC;
           counter_i : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_Sj : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_j : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_Si : in  STD_LOGIC_VECTOR (7 downto 0);
           counter_t : in  STD_LOGIC_VECTOR (7 downto 0);
           out_Si : out  STD_LOGIC_VECTOR (7 downto 0);
           out_Sj : out  STD_LOGIC_VECTOR (7 downto 0);
           out_St : out  STD_LOGIC_VECTOR (7 downto 0));
end s_box;

architecture Behavioral of s_box is

component ram_block is
    Port ( clock : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (7 downto 0);
           address : in  STD_LOGIC_VECTOR (7 downto 0);
           data_read : in  STD_LOGIC;
           data_write : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;


begin

ram_i : ram_block
port map (
	clock => clock,
	data => counter_i,
	address => counter_Si,
	data_read => i_read,
	data_write => i_write,
	reset => reset,
	output => out_Si
);

ram_j : ram_block
port map (
	clock => clock,
	data => counter_j,
	address => counter_Sj,
	data_read => j_read,
	data_write => j_write,
	reset => reset,
	output => out_Sj
);

ram_t : ram_block
port map (
	clock => clock,
	data => counter_i, --BDNE ALE NIE WIEM GDZIE TO PODPI PKI CO
	address => counter_t,
	data_read => t_read,
	data_write => t_write,
	reset => reset,
	output => out_St
);

end Behavioral;

