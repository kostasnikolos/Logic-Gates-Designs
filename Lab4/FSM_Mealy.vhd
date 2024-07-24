----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:10 05/06/2021 
-- Design Name: 
-- Module Name:    FSM_Mealy - Behavioral 
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

entity FSM_Mealy is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Control : out  STD_LOGIC_VECTOR (2 downto 0));
end FSM_Mealy;
	
																	-- this is a mealy FSM with 5 conditions
architecture Behavioral of FSM_Mealy is
TYPE State_type IS (State_0,State_1,State_2,State_3,State_4) ;
SIGNAL y : State_type ;

begin

	process
	begin
	
wait until Clk'event and Clk = '1';	
if RST = '0' THEN                     					-- Reset is active so we set the machine to condition "000"
	y<= State_0;
else
	case y is                                   		-- else we check the present conditions and the given values A,B inorder to proceed to the next condition
		when State_0 =>
			if(A = '1' AND B = '1') then
			y <= State_0;
			elsif (A = '0' AND B = '0') then
			y <= State_0;
			elsif (A = '0' AND B = '1') then
			y <= State_4;
			elsif (A = '1' AND B = '0') then
			y <= State_1;
			end if;
		
		when State_1 =>
			if(A = '1' AND B = '1') then
			y <= State_0;
			elsif (A = '0' AND B = '0') then
			y <= State_0;
			elsif (A = '0' AND B = '1') then
			y <= State_0;
			elsif (A = '1' AND B = '0') then
			y <= State_2;
			end if;
			
		when State_2 =>
			if(A = '1' AND B = '1') then
			y <= State_0;
			elsif (A = '0' AND B = '0') then
			y <= State_0;
			elsif (A = '0' AND B = '1') then
			y <= State_1;
			elsif (A = '1' AND B = '0') then
			y <= State_3;
			end if;
			
		when State_3 =>
			if(A = '1' AND B = '1') then
			y <= State_0;
			elsif (A = '0' AND B = '0') then
			y <= State_0;
			elsif (A = '0' AND B = '1') then
			y <= State_2;
			elsif (A = '1' AND B = '0') then
			y <= State_4;
			end if;
			
		when State_4 =>
			if(A = '1' AND B = '1') then
			y <= State_0;
			elsif (A = '0' AND B = '0') then
			y <= State_0;
			elsif (A = '0' AND B = '1') then
			y <= State_3;
			elsif (A = '1' AND B = '0') then
			y <= State_0;
			end if;
			
			
			end case;
			
		end if;
		
			end process;
			
		with y select Control <=
			"000" when State_0,
			"001" when State_1,
			"010" when State_2,
			"011" when State_3,
			"100" when State_4;
			
			


end Behavioral;

