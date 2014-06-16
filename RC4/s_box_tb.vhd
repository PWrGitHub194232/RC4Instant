--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:44:06 06/16/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/s_box_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: s_box
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
 
ENTITY s_box_tb IS
END s_box_tb;
 
ARCHITECTURE behavior OF s_box_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT s_box
    PORT(
         s_box_clock : IN  std_logic;
         s_box_reset : IN  std_logic;
         s_box_i_read : IN  std_logic;
         s_box_i_write : IN  std_logic;
         s_box_j_read : IN  std_logic;
         s_box_j_write : IN  std_logic;
         s_box_t_read : IN  std_logic;
         s_box_t_write : IN  std_logic;
         s_box_counter_i : IN  std_logic_vector(7 downto 0);
         s_box_counter_Sj : IN  std_logic_vector(7 downto 0);
         s_box_counter_j : IN  std_logic_vector(7 downto 0);
         s_box_counter_Si : IN  std_logic_vector(7 downto 0);
         s_box_counter_t : IN  std_logic_vector(7 downto 0);
         s_box_out_Si : OUT  std_logic_vector(7 downto 0);
         s_box_out_Sj : OUT  std_logic_vector(7 downto 0);
         s_box_out_St : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s_box_clock : std_logic := '0';
   signal s_box_reset : std_logic := '0';
   signal s_box_i_read : std_logic := '0';
   signal s_box_i_write : std_logic := '0';
   signal s_box_j_read : std_logic := '0';
   signal s_box_j_write : std_logic := '0';
   signal s_box_t_read : std_logic := '0';
   signal s_box_t_write : std_logic := '0';
   signal s_box_counter_i : std_logic_vector(7 downto 0) := (others => '0');
   signal s_box_counter_Sj : std_logic_vector(7 downto 0) := (others => '0');
   signal s_box_counter_j : std_logic_vector(7 downto 0) := (others => '0');
   signal s_box_counter_Si : std_logic_vector(7 downto 0) := (others => '0');
   signal s_box_counter_t : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal s_box_out_Si : std_logic_vector(7 downto 0);
   signal s_box_out_Sj : std_logic_vector(7 downto 0);
   signal s_box_out_St : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant s_box_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: s_box PORT MAP (
          s_box_clock => s_box_clock,
          s_box_reset => s_box_reset,
          s_box_i_read => s_box_i_read,
          s_box_i_write => s_box_i_write,
          s_box_j_read => s_box_j_read,
          s_box_j_write => s_box_j_write,
          s_box_t_read => s_box_t_read,
          s_box_t_write => s_box_t_write,
          s_box_counter_i => s_box_counter_i,
          s_box_counter_Sj => s_box_counter_Sj,
          s_box_counter_j => s_box_counter_j,
          s_box_counter_Si => s_box_counter_Si,
          s_box_counter_t => s_box_counter_t,
          s_box_out_Si => s_box_out_Si,
          s_box_out_Sj => s_box_out_Sj,
          s_box_out_St => s_box_out_St
        );

   -- Clock process definitions
   s_box_clock_process :process
   begin
		s_box_clock <= '0';
		wait for s_box_clock_period/2;
		s_box_clock <= '1';
		wait for s_box_clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for s_box_clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
