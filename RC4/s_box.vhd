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
    Port ( s_box_clock : in  STD_LOGIC;
           s_box_reset : in  STD_LOGIC;
           s_box_i_read : in  STD_LOGIC;
           s_box_i_write : in  STD_LOGIC;
           s_box_j_read : in  STD_LOGIC;
           s_box_j_write : in  STD_LOGIC;
           s_box_t_read : in  STD_LOGIC;
           s_box_t_write : in  STD_LOGIC;
           s_box_counter_i : in  STD_LOGIC_VECTOR (7 downto 0);
           s_box_counter_Sj : in  STD_LOGIC_VECTOR (7 downto 0);
           s_box_counter_j : in  STD_LOGIC_VECTOR (7 downto 0);
           s_box_counter_Si : in  STD_LOGIC_VECTOR (7 downto 0);
           s_box_counter_t : in  STD_LOGIC_VECTOR (7 downto 0);
           s_box_out_Si : out  STD_LOGIC_VECTOR (7 downto 0);
           s_box_out_Sj : out  STD_LOGIC_VECTOR (7 downto 0);
           s_box_out_St : out  STD_LOGIC_VECTOR (7 downto 0));
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
	clock => s_box_clock,
	data => s_box_counter_i,
	address => s_box_counter_Si,
	data_read => s_box_i_read,
	data_write => s_box_i_write,
	reset => s_box_reset,
	output => s_box_out_Si
);

ram_j : ram_block
port map (
	clock => s_box_clock,
	data => s_box_counter_j,
	address => s_box_counter_Sj,
	data_read => s_box_j_read,
	data_write => s_box_j_write,
	reset => s_box_reset,
	output => s_box_out_Sj
);

ram_t : ram_block
port map (
	clock => s_box_clock,
	data => s_box_counter_i, --BDNE ALE NIE WIEM GDZIE TO PODPI PKI CO
	address => s_box_counter_t,
	data_read => s_box_t_read,
	data_write => s_box_t_write,
	reset => s_box_reset,
	output => s_box_out_St
);

end Behavioral;

