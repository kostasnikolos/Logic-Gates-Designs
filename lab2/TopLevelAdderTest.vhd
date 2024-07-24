--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:27:46 03/24/2021
-- Design Name:   
-- Module Name:   /home/ise/Documents/lab2/TopLevelAdderTest.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopLevelAdder
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
 
ENTITY TopLevelAdderTest IS
END TopLevelAdderTest;
 
ARCHITECTURE behavior OF TopLevelAdderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopLevelAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         C3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C3 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevelAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          C3 => C3
        );



   -- Stimulus process	
   stim_proc: process												-- We store some values to complete the simulation
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			A<="0110";
      B<="0011";
		Cin <= '0';
		wait for 100 ns;	
      A<="1111";
      B<="1111";
		Cin <= '0';
		wait for 100 ns;		
      A<="1111";
      B<="1111";
		Cin <= '1';
		wait for 100 ns;
      A<="0101";
      B<="1010";
		Cin<='1';
		wait for 100 ns;	
      A<="1010";
      B<="0111";
		Cin <= '0';
		wait for 100 ns;	
      A<="1000";
      B<="1011";
		Cin <= '0';
		wait for 100 ns;	
      A<="1011";
      B<="1001";
		Cin <= '1';
		


      wait;
   end process;

END;
