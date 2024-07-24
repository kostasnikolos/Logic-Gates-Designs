----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:26 03/19/2021 
-- Design Name: 
-- Module Name:    Sum - Behavioral 
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

entity Sum is
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);							-- input 1 propagate from GeneratePropagate Unit
           C : in  STD_LOGIC_VECTOR (2 downto 0);							-- input 2 Carry from CarryLookAhead Unit
           Cin : in  STD_LOGIC;													-- input 3 from user
           S : out  STD_LOGIC_VECTOR (3 downto 0));						-- output sum
end Sum;

architecture Behavioral of Sum is												-- architecture (function) declaration (HOW the outputs ar calculated) 

begin


S(0) <= P(0) XOR Cin;																-- Sum Operation															
S(1) <= P(1) XOR C(0);
S(2) <= P(2) XOR C(1);
S(3) <= P(3) XOR C(2);

end Behavioral;

