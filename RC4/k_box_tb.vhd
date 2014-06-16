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
--USE ieee.numeric_std.ALL;
 
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
   signal k_box_key_write : std_logic := '0';
   signal k_box_address : std_logic_vector(7 downto 0) := (others => '0');
   signal k_box_reset : std_logic := '0';
   signal k_box_clk : std_logic := '0';

 	--Outputs
   signal k_box_key_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant k_box_clk_period : time := 10 ns;
 
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

      wait;
   end process;

END;
