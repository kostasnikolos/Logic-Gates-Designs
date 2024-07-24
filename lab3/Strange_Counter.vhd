----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:17 04/12/2021 
-- Design Name: 
-- Module Name:    Strange_Counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Strange_Counter is
    Port ( Clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Control : in  STD_LOGIC_VECTOR (2 downto 0);
           Count : out  STD_LOGIC_VECTOR (7 downto 0);
           Overflow : out  STD_LOGIC;
           Underflow : out  STD_LOGIC;
           Valid : out  STD_LOGIC);
end Strange_Counter;

-- this is a strange counter with a range of [0,255] and
-- it has oveflow, underflow signals used when count is out of range
architecture Behavioral of Strange_Counter is

signal Count_temp: STD_LOGIC_VECTOR(7 DOWNTO 0) ;							--Declaration of temporary signals
signal Valid_temp : STD_LOGIC;

begin
	process
		begin
		
		wait until Clk'event and Clk = '1';
  
	if RST = '1' then																	--Rest is active so count , overflow , underflow are set to 0 and valid to 1
		Count_temp<= "00000000";
		Overflow <= '0';
		Underflow <= '0';
		Valid_temp <= '1';
	else 
		if Valid_temp= '1' then														-- First , we check if valid=1 so that we can count
			
			if Control= "000" then													-- then we read the step that is given and chek if the count + step exits the
																							-- range of [0,255] if it does we set the value of overflow or underflow to 1 based
																							--  on the case and valid to 0. Otherwise we continue counting and set counter to
																							-- counter_temp
				if Count_temp < 5 then
					Overflow <= '0';
					Underflow <= '1';
					Valid_temp <= '0';
					Count_temp <= Count_temp ;
					
				else
				
				
					Count_temp <= Count_temp - 5;
					
					end if;
				
			elsif Control= "001" then
				
				if Count_temp < 2 then
					Overflow <= '0';
					Underflow <= '1';
					Valid_temp <= '0';
					Count_temp <= Count_temp ;
					
				else 
					
					Count_temp <= Count_temp - 2;
				end if;
				
         elsif Control = "010" then
			
            
                Count_temp <= Count_temp;
			
			elsif Control = "011" then
			
				if Count_temp > 254 then
					Overflow <= '1';
					Underflow <= '0';
					Valid_temp <= '0';
					Count_temp <= Count_temp   ;
				
				else
					
					Count_temp <= Count_temp + 1;
				
				end if;
			
			elsif Control = "100" then
				if Count_temp > 253 then
					Overflow <= '1';
					Underflow <= '0';
					Valid_temp <= '0';
					Count_temp <= Count_temp  ;
				
				else 
			
					Count_temp <= Count_temp + 2;
				end if;
				
				 elsif Control = "101" then
				 
				if Count_temp > 250 then
					Overflow <= '1';
					Underflow <= '0';
					Valid_temp<= '0';
					Count_temp <= Count_temp   ;
				
				else 	
					Count_temp <= Count_temp + 5;
					
				
				end if;
				
			elsif Control = "110" then
			
				if Count_temp > 249 then
					
						Overflow <= '1';
						Underflow <= '0';
						Valid_temp <= '0';
						Count_temp <= Count_temp   ;
				
				else 
					
					Count_temp <= Count_temp + 6;
				
				end if;
				
				elsif Control = "111" then
				
					if Count_temp > 243 then
						Overflow <= '1';
						Underflow <= '0';
						Valid_temp <= '0';
						Count_temp <= Count_temp  ;
				
					else 
						
						Count_temp <= Count_temp + 12;
				
					end if;
				end if;
			else
				Valid_temp <= Valid_temp;
				Overflow <= '0';
				Underflow <= '0';
				Count_temp <= Count_temp;
			end if;
			
		
		end if;
		end process;
		
		Valid <= Valid_temp;
		
		Count <= Count_temp;
				
  
end Behavioral;

