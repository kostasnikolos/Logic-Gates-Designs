----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:41 03/09/2021 
-- Design Name: 
-- Module Name:    lab1_full_adder - Behavioral 
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

entity lab1_full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end lab1_full_adder;

architecture Behavioral of lab1_full_adder is

component lab1_half_adder
port (A, B : in std_logic;
		Sum, Carry : out std_logic);
end component;

signal hs, hc, tc: std_logic;

begin
	HA1: lab1_half_adder
			port map (A=>A,
					B=>B,
					Sum =>hs,
					Carry=>hc);
	HA2: lab1_half_adder
			port map ( A=> hs,
							B=> Cin,
							Sum=> Sum,
							Carry=> tc);
	Cout <= tc or hc;
			
					
		

end Behavioral;

