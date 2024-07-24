----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:01 03/24/2021 
-- Design Name: 
-- Module Name:    TopLevelAdder - Behavioral 
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

entity TopLevelAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);										-- inputs A,B,Cin from the user
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);										-- Outputs will be calculated from the components
           C3 : out  STD_LOGIC);
end TopLevelAdder;

architecture Behavioral of TopLevelAdder is


Component GeneratePropagate is																-- component GeneratePropagate declaration
		Port( A : in STD_LOGIC_VECTOR(3 downto 0);
				B : in  STD_LOGIC_VECTOR (3 downto 0);
				G : out  STD_LOGIC_VECTOR (3 downto 0);
				P : out  STD_LOGIC_VECTOR (3 downto 0));
				
	end Component;
	
		Component LookAhead is																	-- component LookAhead declaration
		Port ( G : in  STD_LOGIC_VECTOR (3 downto 0);
				P : in  STD_LOGIC_VECTOR (3 downto 0);
				Cin : in  STD_LOGIC;
					C3 : out  STD_LOGIC;
					C : out  STD_LOGIC_VECTOR (2 downto 0));
			
	end Component;
	
	Component Sum is																				-- component Sum declaration
		Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
				C : in  STD_LOGIC_VECTOR (2 downto 0);
				Cin : in  STD_LOGIC;
				S : out  STD_LOGIC_VECTOR (3 downto 0));
	end Component;
	
	signal Gen,Prop: STD_LOGIC_VECTOR (3 downto 0);										-- Signals declaration , will be uses to pass bits from one component to another
	signal Carry_In : STD_LOGIC_VECTOR (2 downto 0);
	
begin
Generate_Propagate: GeneratePropagate port map(											

													A => A,											-- A,B are passed as inputs 
													B => B,
													G => Gen,										--Generate is calculated and stored to Gen signal	
													P => Prop);										--Propagate is calculated and stored to Prop signal
CarryLookAhead: LookAhead port map(			G=> Gen,										--Generatte, Propagate are passed from the signals and Cin from the user		
														P => Prop,									
														Cin => Cin,									
														C => Carry_In,								-- Carry is calculated and stored to Carry_in signal
														C3 => C3);									-- Carries are calculated
SumUnit: sum port map(		
								Cin => Cin,															--Carries are passed from the singal Carry_in,Propagate is passed from the signal Prop and Cin from the user
								C => Carry_In,
								P => Prop,
								S => S );															-- Sum Calculation
		
end Behavioral;

