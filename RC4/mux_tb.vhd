--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:42:23 06/16/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/mux_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
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
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         mux_input_1 : IN  std_logic_vector(7 downto 0);
         mux_input_2 : IN  std_logic_vector(7 downto 0);
         mux_swith : IN  std_logic;
         mux_output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_input_1 : std_logic_vector(7 downto 0) := (others => '0');
   signal mux_input_2 : std_logic_vector(7 downto 0) := (others => '1');
   signal mux_swith : std_logic := '0';

 	--Outputs
   signal mux_output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
	--Test vectors
	type test_vector_array_bin is array (natural range <>) of std_logic;
		
	constant test_vectors_switch : test_vector_array_bin :=
		('0',	'1');
		
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          mux_input_1 => mux_input_1,
          mux_input_2 => mux_input_2,
          mux_swith => mux_swith,
          mux_output => mux_output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

			mux_swith <= STD_LOGIC( test_vectors_switch(0));
		
      wait;
   end process;

END;
