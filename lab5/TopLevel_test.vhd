--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:42 05/19/2021
-- Design Name:   
-- Module Name:   /home/ise/ISE/lab5/TopLevel_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopLevel
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
 
ENTITY TopLevel_test IS
END TopLevel_test;
 
ARCHITECTURE behavior OF TopLevel_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopLevel
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         NumberIN : IN  std_logic_vector(3 downto 0);
         NumberOUT : OUT  std_logic_vector(3 downto 0);
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal NumberIN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NumberOUT : std_logic_vector(3 downto 0);
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevel PORT MAP (
          CLK => CLK,
          RST => RST,
          Push => Push,
          Pop => Pop,
          NumberIN => NumberIN,
          NumberOUT => NumberOUT,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull
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
	
	
		
      -- reset to s0
		RST		<= '1';
		Push		<=	'0';
		Pop		<=	'0';
		NumberIN	<=	"0000";
		wait for 150 ns;

		-- enter the number 15 (s1)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1111";
		wait for 50 ns;

		-- enter the number 14 (s2)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1110";
		wait for 50 ns;

		-- enter the number 13 (s3)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1101";
		wait for 50 ns;

		-- enter the number 12 (s4)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1100";
		wait for 50 ns;

		-- enter the number 11 (s5)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1011";
		wait for 50 ns;

		-- enter the number 10 (s6)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1010";
		wait for 50 ns;

		-- enter the number 9 (s7)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1001";
		wait for 50 ns;

		-- enter the number 8 (s8)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1000";
		wait for 50 ns;

		-- enter the number 7 (s9)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"0111";
		wait for 50 ns;

		-- enter the number 6 (s10)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"0110";
		wait for 50 ns;
		

		-- pop a number (s10)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s9)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s8)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s7)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s6)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s5)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s4)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s3)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s2)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- pop a number (s1)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
				-- pop a number (s1)
		RST		<= '0';
		Push		<=	'0';
		Pop		<=	'1';
		NumberIN	<=	"0000";
		wait for 50 ns;
		
		-- FILL THE STACK AGAIN TO TEST PUSHING WHEN FULL
		
				-- enter the number 15 (s1)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1111";
		wait for 50 ns;

		-- enter the number 14 (s2)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1110";
		wait for 50 ns;

		-- enter the number 13 (s3)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1101";
		wait for 50 ns;

		-- enter the number 12 (s4)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1100";
		wait for 50 ns;

		-- enter the number 11 (s5)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1011";
		wait for 50 ns;

		-- enter the number 10 (s6)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1010";
		wait for 50 ns;

		-- enter the number 9 (s7)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1001";
		wait for 50 ns;

		-- enter the number 8 (s8)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"1000";
		wait for 50 ns;

		-- enter the number 7 (s9)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"0111";
		wait for 50 ns;

		-- enter the number 6 (s10)
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"0110";
		wait for 50 ns;
		
		-- TRY TO ENTER ONE MORE NUMBER
		-- this should fail
		RST		<= '0';
		Push		<=	'1';
		Pop		<=	'0';
		NumberIN	<=	"0001";
		wait for 50 ns;		
		
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
