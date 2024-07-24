----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:50 03/11/2021 
-- Design Name: 
-- Module Name:    lab1_full_adder_2bits - Behavioral 
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

entity lab1_full_adder_2bits is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (1 downto 0));
end lab1_full_adder_2bits;

architecture Behavioral of lab1_full_adder_2bits is


component lab1_full_adder
		port( A, B, Cin : in STD_LOGIC;
				Sum,Cout : out STD_LOGIC);
				
	end component;
	
signal Carry_in_out,Sum0,Sum1,Carry: STD_LOGIC;

begin
FA1: lab1_full_adder
			port map (A=> A(0),
							B=> B(0),
							Cin=>Cin,
							Sum=>Sum0,
							Cout=>Carry_in_out);
							
FA2: lab1_full_adder
			port map (A=> A(1),
							B=>B(1),
							Cin=>Carry_in_out,
							Sum=> Sum1,
							Cout=> Carry);
Sum(0)<= Sum0;
Sum(1)<= Sum1;
Cout<= Carry_in_out OR Carry;
							



	
end Behavioral;

