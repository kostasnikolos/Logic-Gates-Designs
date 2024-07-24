----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:38 05/19/2021 
-- Design Name: 
-- Module Name:    FSM_swsto - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_swsto is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC;
           Addr : out  STD_LOGIC_VECTOR(3 DOWNTO 0);
           Write_enable : out  STD_LOGIC_VECTOR(0 DOWNTO 0));
end FSM_swsto;

architecture Behavioral of FSM_swsto is

-- Declare the possible states (state type)
type state_t is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
signal state : state_t;

begin
	
	process
	
	begin
		wait until Clk'event and clk = '0';
		
		if RST='1' then
			state				<= S0;
			addr 				<= "0000";
			Write_enable 	<= "0";
			Empty				<= '1';
			AlmostEmpty		<= '0';
			Full				<= '0';
			AlmostFull		<= '0';
		else
			case state is
				when S0	=>
					if (Push='1') then
						Addr 				<= "0001";
						Write_enable 	<= "1";
						state 			<= S1;
						Empty 			<= '0';
						AlmostEmpty 	<= '1';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S1	=>
					if (Push='1') then
						state 			<= S2;
						Write_enable 	<= "1";
						Addr 				<= "0010";
						AlmostEmpty 	<= '1';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S0;
						Addr 				<= "0000";
						AlmostEmpty 	<= '0';
						Empty				<= '1';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S2	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S3;
						Addr 				<= "0011";
						AlmostEmpty 	<= '1';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S1;
						Addr 				<= "0001";
						AlmostEmpty 	<= '1';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S3	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S4;
						Addr 				<= "0100";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S2;
						Addr 				<= "0010";
						AlmostEmpty 	<= '1';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S4	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S5;
						Addr 				<= "0101";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S3;
						Addr 				<= "0011";
						AlmostEmpty 	<= '1';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S5	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S6;
						Addr 				<= "0110";
						AlmostEmpty 	<= '0';
						Empty				<= '0';		
						Full				<= '0';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S4;
						Addr 				<= "0100";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S6	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S7;
						Addr 				<= "0111";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '1';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S5;
						Addr 				<= "0011";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S7	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S8;
						Addr 				<= "1000";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '1';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S6;
						Addr 				<= "0101";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '0';
					end if;
				when S8	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S9;
						Addr 				<= "1001";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '1';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S7;
						Addr 				<= "0111";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '1';
					end if;
				when S9	=>
					if (Push='1') then
						Write_enable 	<= "1";
						state 			<= S10;
						Addr 				<= "1010";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '1';
						AlmostFull		<= '0';
					elsif (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S8;
						Addr 				<= "1000";
						AlmostEmpty 	<= '0';
						Empty				<= '0';		
						Full				<= '0';
						AlmostFull		<= '1';
					end if;
				when S10	=>
					if (Pop='1') then
						Write_enable 	<= "0";
						state 			<= S9;
						Addr 				<= "1001";
						AlmostEmpty 	<= '0';
						Empty				<= '0';
						Full				<= '0';
						AlmostFull		<= '1';
					else 
						-- if stack is full and user tries to continue writing
						-- dont let it happen
						Write_enable 	<= "0";
						state				<= S10;
					end if;
				-- continue the cases
			end case; -- end the cases
		end if;		-- end the if at line 58
	end process;		-- end the process at line 53
end Behavioral;

