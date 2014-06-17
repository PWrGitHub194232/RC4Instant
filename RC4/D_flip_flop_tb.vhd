--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:30 06/16/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/D_flip_flop_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: D_flip_flop
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
 
ENTITY D_flip_flop_tb IS
END D_flip_flop_tb;
 
ARCHITECTURE behavior OF D_flip_flop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_flip_flop
    PORT(
         clock : IN  std_logic;
         D : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
 --Test vectors
	type test_vector_array is array (natural range <>)	of natural;

 	constant test_vectors_D : test_vector_array :=
		(0,4,7,5,3,23,222);


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_flip_flop PORT MAP (
          clock => clock,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		
      -- insert stimulus here 

		for i in test_vectors_D'range loop
			D <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_D(i), 8 ) );
			wait for clock_period/2; -- Testowo clk/2
		end loop;
		
      wait;
   end process;

END;
