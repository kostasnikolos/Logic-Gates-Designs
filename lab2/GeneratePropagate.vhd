----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:52 03/19/2021 
-- Design Name: 
-- Module Name:    GeneratePropagate - Behavioral 
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

entity GeneratePropagate is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);										-- input 1 from user
           B : in  STD_LOGIC_VECTOR (3 downto 0);										-- input 2 from user
           G : out  STD_LOGIC_VECTOR (3 downto 0);										-- output generate , will be used to calculate carry
           P : out  STD_LOGIC_VECTOR (3 downto 0));									-- output propagate , will be used to calculate carry and sum
end GeneratePropagate;

architecture Behavioral of GeneratePropagate is

begin																									-- Generate,Propagate calculation
P<= A XOR B;
G<= A AND B;

end Behavioral;

