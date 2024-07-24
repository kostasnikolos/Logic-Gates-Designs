--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:18:35 05/19/2021
-- Design Name:   
-- Module Name:   /home/ise/ISE/lab5/memory_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
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
 
ENTITY memory_test IS
END memory_test;
 
ARCHITECTURE behavior OF memory_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(3 downto 0);
         dina : IN  std_logic_vector(3 downto 0);
         douta : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(3 downto 0) := (others => '0');
   signal dina : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		-- Try to write but with enable set to "0"
		-- It should fail.
		wea	<= "0";
		dina	<=	"0001";
		wait for 100 ns;
		
		-- Try to write with enable set to "1"
		-- The change should go through and appear at
		-- douta at the next clock pulse
		wea	<= "1";
		dina	<=	"0011";
		wait for 100 ns;
		
		-- Write at a specific address
		wea	<= "1";
		addra <= "0001";
		dina	<=	"0111";
		wait for 100 ns;
		
		-- Read from a specific address
		wea	<= "0";
		addra <= "0000";
		wait for 100 ns;
	
      -- hold reset state for 100 ns.
      	

      wait for clka_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
