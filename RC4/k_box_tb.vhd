--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:41:47 06/16/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/k_box_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: k_box
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY k_box_tb IS
END k_box_tb;
 
ARCHITECTURE behavior OF k_box_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT k_box
	 generic (
		key_size : natural := 127;
		word_size : natural := 8;
		s_box_size : natural := 8);
    PORT(
         k_box_key_input : IN  std_logic;
         k_box_key_read : IN  std_logic;
         k_box_key_write : IN  std_logic;
         k_box_address : IN  std_logic_vector(s_box_size-1 downto 0);
         k_box_reset : IN  std_logic;
         k_box_clk : IN  std_logic;
         k_box_key_out : OUT  std_logic_vector(word_size-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal k_box_key_input : std_logic := '0';
   signal k_box_key_read : std_logic := '0';
   signal k_box_key_write : std_logic := '1';
   signal k_box_address : std_logic_vector(7 downto 0) := (others => '0');
   signal k_box_reset : std_logic := '0';
   signal k_box_clk : std_logic := '0';

 	--Outputs
   signal k_box_key_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant k_box_clk_period : time := 10 ns;
	
	signal a : integer := 0;
	signal b : natural := 0;
	signal c : natural := 0;

	--Test vectors
	type test_vector_array is array (natural range <>)	of natural;
	type test_vector_array_bin is array (natural range <>) of std_logic;

	constant test_vectors_key : test_vector_array_bin :=
		('1',	'1',	'0',	'0',	'0',	'1',	'1',	'0',	'1',	'1',	'0',	'1',	'1',	'1',	'1',	'1',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'1',	'1',	'1',	'1',	'1',	'0',	'1',	'1',	'0',	'1',	'0',	'0',	'0',	'1',	'0',	'0',	'0',	'1',	'1',	'0',	'1',	'1',	'1',	'1',	'1',	'1',	'0',	'0',	'0',	'0',	'1',	'1',	'0',	'0',	'1',	'1',	'0',	'0',	'1',	'0',	'0',	'0',	'1',	'0',	'1',	'0',	'0',	'0',	'1',	'1',	'0',	'0',	'1',	'0',	'1',	'0',	'0',	'1',	'0',	'0',	'0',	'0',	'1',	'0',	'1',	'0',	'1',	'0',	'0',	'1',	'1',	'0',	'0',	'0',	'0',	'1',	'0',	'0',	'1',	'1',	'0',	'1',	'1',	'0',	'1',	'0',	'0',	'0',	'0',	'1',	'0',	'1',	'1',	'0',	'0',	'0',	'1',	'0',	'0',	'0',	'0',	'1',	'0' );
		
	constant test_vectors_read : test_vector_array_bin :=
		--('0',	'0',	'0',	'0',	'0',	'1',	'0',	'1',	'1',	'1',	'1',	'1',	'1');
		('0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'1');
		
	constant test_vectors_write : test_vector_array_bin :=
		('0',	'0',	'0',	'0',	'0',	'0',	'0',	'0'	,'0',	'0',	'0',	'0',	'0');
 
 	constant test_vectors_address : test_vector_array :=
(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255);

	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: k_box PORT MAP (
          k_box_key_input => k_box_key_input,
          k_box_key_read => k_box_key_read,
          k_box_key_write => k_box_key_write,
          k_box_address => k_box_address,
          k_box_reset => k_box_reset,
          k_box_clk => k_box_clk,
          k_box_key_out => k_box_key_out
        );

   -- Clock process definitions
   k_box_clk_process :process
   begin
		k_box_clk <= '0';
		wait for k_box_clk_period/2;
		k_box_clk <= '1';
		wait for k_box_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for k_box_clk_period*10;

		-- insert stimulus here 
	

		for i in test_vectors_address'range loop
			k_box_address <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_address(i), 8 ) );
			k_box_key_input <= STD_LOGIC( test_vectors_key(i mod (127+1)));
			wait for k_box_clk_period/2;
		end loop;
		

		k_box_key_read <= '1';
		k_box_key_write <= '0';

		for i in test_vectors_address'range loop
			k_box_address <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_address(i), 8 ) );
			wait for k_box_clk_period;
		end loop;
		
		
      wait;
   end process;

END;
