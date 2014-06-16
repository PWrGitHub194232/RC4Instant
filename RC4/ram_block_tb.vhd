--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:06:47 06/16/2014
-- Design Name:   
-- Module Name:   /home/tomasz/workspace/VHDL_workspace/vhdl/vhdl/ram_block_tb.vhd
-- Project Name:  vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram_block
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
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ram_block_tb IS
END ram_block_tb;
 
ARCHITECTURE behavior OF ram_block_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram_block
    PORT(
         clock : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         address : IN  std_logic_vector(7 downto 0);
         data_read : IN  std_logic;
         data_write : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	-- wait period 
	constant wait_time : time:= 10 ns;
	
   --Inputs
   signal clock : std_logic := '0';
   signal tbdata : std_logic_vector(7 downto 0) := (others => '0');
   signal tbaddress : std_logic_vector(7 downto 0) := (others => '0');
   signal tbdata_read : std_logic := '0';
   signal tbdata_write : std_logic := '0';
   signal tbreset : std_logic := '1';

 	--Outputs
   signal tboutput : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
	
	--Test vectors
	type test_vector_array is array (natural range <>)	of natural;
	type test_vector_array_bin is array (natural range <>) of std_logic;
	constant test_vectors_data : test_vector_array :=
		(20,	50	,	105,	138,	201,	222,	234);
	constant test_vectors_address : test_vector_array :=
		(0	,	1	,	2	,	3	,	4	,	3	,	6);
	constant test_vectors_read : test_vector_array_bin :=
		('0',	'0',	'0',	'0',	'0',	'1',	'1');
	constant test_vectors_write : test_vector_array_bin :=
		('1',	'1',	'1',	'1',	'1',	'0',	'0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram_block PORT MAP (
          clock => clock,
          data => tbdata,
          address => tbaddress,
          data_read => tbdata_read,
          data_write => tbdata_write,
          reset => tbreset,
          output => tboutput
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
     -- wait for 100 ns;	

      --wait for clock_period*10;
		wait for wait_time*5;	-- let the UNIT settle down
		
      -- insert stimulus here 
	
		-- begin looping through test vectors
		for i in test_vectors_data' range loop
			-- load data into design
			tbdata <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_data(i), 8 ) );
			tbaddress <= STD_LOGIC_VECTOR(TO_UNSIGNED( test_vectors_address(i), 8 ) );
			tbdata_read <= STD_LOGIC(test_vectors_read(i));
			tbdata_write <= STD_LOGIC( test_vectors_write(i));
			-- wait for calculation
			wait for wait_time;
		end loop;

      wait;
   end process;

END;
