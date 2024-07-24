----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:22 03/19/2021 
-- Design Name: 
-- Module Name:    LookAhead - Behavioral 
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

entity LookAhead is
    Port ( G : in  STD_LOGIC_VECTOR (3 downto 0);										-- input 1 propagate from GeneratePropagateUnit
           P : in  STD_LOGIC_VECTOR (3 downto 0);										-- input 2 generate from GeneratePropagateUnit
           Cin : in  STD_LOGIC;																-- input 3 carry in from user
           C : out  STD_LOGIC_VECTOR (2 downto 0);										-- output carry will be used to calculate sum
           C3 : out  STD_LOGIC);																-- output Carry out
end LookAhead;

architecture Behavioral of LookAhead is

begin

C(0) <= G(0) OR (P(0) AND Cin);																-- Carry Calculation
C(1) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
C(2) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
C3 <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);

end Behavioral;

