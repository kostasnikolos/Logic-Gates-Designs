--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:58:12 03/19/2021
-- Design Name:   
-- Module Name:   /home/ise/Documents/lab2/GeneratePropagateTest.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GeneratePropagate
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
 
ENTITY GeneratePropagateTest IS
END GeneratePropagateTest;
 
ARCHITECTURE behavior OF GeneratePropagateTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GeneratePropagate
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         G : OUT  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal G : std_logic_vector(3 downto 0);
   signal P : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GeneratePropagate PORT MAP (
          A => A,
          B => B,
          G => G,
          P => P
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
	
      A<= "1111";
		B<= "1011";
      wait for 100 ns;	
		A<="1010";
		B<= "0111";
      wait for 100 ns;
		A<="1000";
		B<= "1001";
      wait for 100 ns;
		A<= "0001";
		B<= "0110";
      wait for 100 ns;
		
		

      

      wait;
   end process;

END;
