--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:47:14 05/19/2021
-- Design Name:   
-- Module Name:   /home/ise/ISE/lab5/FSM_swsto_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_swsto
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
 
ENTITY FSM_swsto_test IS
END FSM_swsto_test;
 
ARCHITECTURE behavior OF FSM_swsto_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_swsto
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         Addr : OUT  std_logic_vector(3 downto 0);
         Write_enable : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';

 	--Outputs
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;
   signal Addr : std_logic_vector(3 downto 0);
   signal Write_enable : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_swsto PORT MAP (
          CLK => CLK,
          RST => RST,
          Push => Push,
          Pop => Pop,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull,
          Addr => Addr,
          Write_enable => Write_enable
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
		RST	<= '1';
		Push	<=	'0';
		Pop	<=	'0';
		wait for 50 ns;

		-- push to s1
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s2
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s3
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s4
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s5
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s6
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s7
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s8
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s9
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;
		
		-- push to s10
		RST	<= '0';
		Push	<=	'1';
		Pop	<=	'0';
		wait for 50 ns;

		-- pop back to s9
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s8
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s7
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s6
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s5
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s4
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s3
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s2
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s1
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- pop back to s0
		RST	<= '0';
		Push	<=	'0';
		Pop	<=	'1';
		wait for 50 ns;


		-- reset again
		RST	<= '1';
		Push	<=	'0';
		Pop	<=	'0';
		wait for 50 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
