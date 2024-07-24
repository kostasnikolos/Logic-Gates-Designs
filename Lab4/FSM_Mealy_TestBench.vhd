--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:54:17 05/07/2021
-- Design Name:   
-- Module Name:   /home/ise/Documents/Lab4/FSM_Mealy_TestBench.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_Mealy
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
 
ENTITY FSM_Mealy_TestBench IS
END FSM_Mealy_TestBench;
 
ARCHITECTURE behavior OF FSM_Mealy_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_Mealy
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         Control : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Control : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_Mealy PORT MAP (
          CLK => CLK,
          RST => RST,
          A => A,
          B => B,
          Control => Control
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
   
	RST <= '0';      										       -- RST  is active we check if the reset is working
	A <= '0';
	B <= '0';
	wait for 100ns;
	
	RST <= '1';														 -- RST  inactive , we check values of '0','0' and '1','1' to check if we stay in the same condition
	A <= '0';
	B <= '0';
	wait for 10ns;
	
	RST <= '1';
	A <= '1';
	B <= '1';
	wait for 10ns;
	
	RST <= '1';														-- A,B values are set to 1,0 to move to the next condition
	A <= '1';
	B <= '0';
	wait for 10ns;
	
	
	RST <= '1';
	A <= '1';
	B <= '0';
	wait for 10ns;
	
	
	RST <= '1';
	A <= '1';
	B <= '0';
	wait for 10ns;
	
	
	RST <= '1';
	A <= '1';
	B <= '0';
	wait for 10ns;
	
	RST <= '0'; 													-- RST is active so we move to condition 000
	A <= '1';
	B <= '0';
	wait for 10ns;
	
	RST <= '1';														-- RST is inactive A, B values are '0', '1' so we move to the previous condition
	A <= '0';
	B <= '1';
	wait for 10ns;
	
	RST <= '1';
	A <= '0';
	B <= '1';
	wait for 10ns;
	
	RST <= '1';
	A <= '0';
	B <= '1';
	wait for 10ns;
	
	RST <= '1';
	A <= '0';
	B <= '1';
	wait for 10ns;
	
	RST <= '1';
	A <= '0';
	B <= '1';
	wait for 10ns;
	
		RST <= '1';
	A <= '1';
	B <= '1';
	wait for 10ns;
		RST <= '1';
	A <= '1';
	B <= '0';
	wait for 10ns;
		RST <= '1';
	A <= '1';
	B <= '1';
	wait for 10ns;
		RST <= '1';
	A <= '1';
	B <= '0';
	wait for 10ns;
	RST <= '1';
	A <= '1';
	B <= '1';
	wait for 10ns;
	
	
	

      wait;
   end process;

END;
