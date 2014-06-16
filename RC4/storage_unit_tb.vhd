--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:13:06 06/17/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/storage_unit_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: storage_unit
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
 
ENTITY storage_unit_tb IS
END storage_unit_tb;
 
ARCHITECTURE behavior OF storage_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT storage_unit
    PORT(
         clock : IN  std_logic;
         key_input_Kbox : IN  std_logic_vector(126 downto 0);
         key_read_Kbox : IN  std_logic;
         key_write_Kbox : IN  std_logic;
         reset_Kbox : IN  std_logic;
         key_sel_Mux : IN  std_logic;
         reset_Sbox : IN  std_logic;
         i_read_Sbox : IN  std_logic;
         j_read_Sbox : IN  std_logic;
         t_read_Sbox : IN  std_logic;
         i_write_Sbox : IN  std_logic;
         j_write_Sbox : IN  std_logic;
         t_write_Sbox : IN  std_logic;
         counter_i_Sbox_Kbox : IN  std_logic_vector(7 downto 0);
         j_enable : IN  std_logic;
         j_reset : IN  std_logic;
         t_enable : IN  std_logic;
         t_reset : IN  std_logic;
         stream : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal key_input_Kbox : std_logic_vector(126 downto 0) := (others => '0');
   signal key_read_Kbox : std_logic := '0';
   signal key_write_Kbox : std_logic := '0';
   signal reset_Kbox : std_logic := '0';
   signal key_sel_Mux : std_logic := '0';
   signal reset_Sbox : std_logic := '0';
   signal i_read_Sbox : std_logic := '0';
   signal j_read_Sbox : std_logic := '0';
   signal t_read_Sbox : std_logic := '0';
   signal i_write_Sbox : std_logic := '0';
   signal j_write_Sbox : std_logic := '0';
   signal t_write_Sbox : std_logic := '0';
   signal counter_i_Sbox_Kbox : std_logic_vector(7 downto 0) := (others => '0');
   signal j_enable : std_logic := '0';
   signal j_reset : std_logic := '0';
   signal t_enable : std_logic := '0';
   signal t_reset : std_logic := '0';

 	--Outputs
   signal stream : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: storage_unit PORT MAP (
          clock => clock,
          key_input_Kbox => key_input_Kbox,
          key_read_Kbox => key_read_Kbox,
          key_write_Kbox => key_write_Kbox,
          reset_Kbox => reset_Kbox,
          key_sel_Mux => key_sel_Mux,
          reset_Sbox => reset_Sbox,
          i_read_Sbox => i_read_Sbox,
          j_read_Sbox => j_read_Sbox,
          t_read_Sbox => t_read_Sbox,
          i_write_Sbox => i_write_Sbox,
          j_write_Sbox => j_write_Sbox,
          t_write_Sbox => t_write_Sbox,
          counter_i_Sbox_Kbox => counter_i_Sbox_Kbox,
          j_enable => j_enable,
          j_reset => j_reset,
          t_enable => t_enable,
          t_reset => t_reset,
          stream => stream
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

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
