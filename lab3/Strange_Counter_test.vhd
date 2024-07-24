--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:53 04/13/2021
-- Design Name:   
-- Module Name:   /home/ise/Documents/lab3/Strange_Counter_test.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Strange_Counter
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
 
ENTITY Strange_Counter_test IS
END Strange_Counter_test;
 
ARCHITECTURE behavior OF Strange_Counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Strange_Counter
    PORT(
         Clk : IN  std_logic;
         RST : IN  std_logic;
         Control : IN  std_logic_vector(2 downto 0);
         Count : OUT  std_logic_vector(7 downto 0);
         Overflow : OUT  std_logic;
         Underflow : OUT  std_logic;
         Valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal RST : std_logic := '0';
   signal Control : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Count : std_logic_vector(7 downto 0);
   signal Overflow : std_logic;
   signal Underflow : std_logic;
   signal Valid : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Strange_Counter PORT MAP (
          Clk => Clk,
          RST => RST,
          Control => Control,
          Count => Count,
          Overflow => Overflow,
          Underflow => Underflow,
          Valid => Valid
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
 

    

RST <= '1';
Control <= "000";
wait for 100 ns;
		
RST <= '0';									-- Underflow check, we will use the control= 000 (step=-5) to check if underflow signal is working
Control <= "000";
wait for 10 ns;

RST <= '1';          					-- then we reset the counter and take a smaill step of 2 (control=100)
Control <= "100";
wait for 10 ns;

RST <= '0'; 
Control <= "100";
wait for 10 ns;	
	
RST <= '0';									-- Overflow check, control is set to 111 (step=+12) to check if overflow is working
Control <= "111";
wait for 220 ns;
													

RST <= '1';									-- now we need to check if every step is working correctly so we reset the counter
Control <= "000";
wait for 10 ns;

RST <= '0';									-- we need to start from the positive steps so that we wont have underflow signals			
Control <= "011";							-- Step=+1 
wait for 10 ns;							--Expected Count= +1

RST <= '0';										
Control <= "100";							-- Step=+2 
wait for 10 ns;							--Expected Count= +3

RST <= '0';
Control <= "101";							-- Step=+5			
wait for 10 ns;							--Expected Count= +8						

RST <= '0';									-- Step=+6
Control <= "110";							--Expected Count= +14
wait for 10 ns;

RST <= '0';									-- Step=+12
Control <= "111";							--Expected Count= +26
wait for 10 ns;

RST <= '0';									-- Step=-5
Control <= "000";							--Expected Count= +21
wait for 10 ns;

RST <= '0';									-- Step=-2
Control <= "001";							--Expected Count= +19
wait for 10 ns;

RST <= '0';									-- Step=0
Control <= "010";							--Expected Count= +19
wait for 10 ns;

RST <= '1';									--We reset the counter before ending the process
Control <= "000";
wait for 10 ns;

wait;  


   end process;

END;
