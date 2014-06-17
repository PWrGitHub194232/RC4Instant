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
    PORT(
         k_box_key_input : IN  std_logic_vector(126 downto 0);
         k_box_key_read : IN  std_logic;
         k_box_key_write : IN  std_logic;
         k_box_address : IN  std_logic_vector(7 downto 0);
         k_box_reset : IN  std_logic;
         k_box_clk : IN  std_logic;
         k_box_key_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal k_box_key_input : std_logic_vector(126 downto 0) := (others => '0');
   signal k_box_key_read : std_logic := '0';
   signal k_box_key_write : std_logic := '1';
   signal k_box_address : std_logic_vector(7 downto 0) := (others => '0');
   signal k_box_reset : std_logic := '0';
   signal k_box_clk : std_logic := '0';

 	--Outputs
   signal k_box_key_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant k_box_clk_period : time := 10 ns;
	
	signal a : natural := 0;
	--Test vectors
	type test_vector_array is array (natural range <>)	of natural;
	type test_vector_array_bin is array (natural range <>) of std_logic;

	constant test_vectors_read : test_vector_array_bin :=
		--('0',	'0',	'0',	'0',	'0',	'1',	'0',	'1',	'1',	'1',	'1',	'1',	'1');
		('0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'0',	'1');
		
	constant test_vectors_write : test_vector_array_bin :=
		('0',	'0',	'0',	'0',	'0',	'0',	'0',	'0'	,'0',	'0',	'0',	'0',	'0');
 
 	constant test_vectors_address : test_vector_array :=
		--(0	,	1	,	2	,	3	,	4	,	3	,	6	,	6	,	4	,	8	,	2	,	1	,	8);
		(0	,	1	,	2	,	3	,	4	,	5	,	6	,	7	,	8	,	9	,	10	,	11	,	6);
	
	constant test_vectors_reset : test_vector_array_bin :=
		('1',	'1',	'1',	'1',	'1',	'1',	'1',	'1'	,'1',	'1',	'1',	'1',	'0');
 
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
	
		a <= 0;
		WHILE a < 16 LOOP
			k_box_address <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_address(a mod 12), 8 ) );
			a <= a+1;
			wait for k_box_clk_period;
		end loop;

		k_box_key_read <= '1';
		k_box_key_write <= '0';

		a <= 0;
		WHILE a < 14 LOOP
			k_box_address <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_address(a mod 12), 8 ) );
			a <= a+1;
			wait for k_box_clk_period;
		end loop;
		
		
      wait;
   end process;

END;
