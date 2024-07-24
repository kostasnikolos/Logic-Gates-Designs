----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:07 05/19/2021 
-- Design Name: 
-- Module Name:    TopLevel - Behavioral 
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

entity TopLevel is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           Pop : in  STD_LOGIC;
           NumberIN : in  STD_LOGIC_VECTOR (3 downto 0);
           NumberOUT : out  STD_LOGIC_VECTOR (3 downto 0);
           Empty : out  STD_LOGIC;
           Full : out  STD_LOGIC;
           AlmostEmpty : out  STD_LOGIC;
           AlmostFull : out  STD_LOGIC);
end TopLevel;

architecture Behavioral of TopLevel is
	-- Declare FSM component
	component FSM_swsto port (
		CLK 			:	in 	STD_LOGIC;
		RST 			:	in 	STD_LOGIC;
		Push			:	in 	STD_LOGIC;
		Pop			:	in		STD_LOGIC;
		Empty			:	out 	STD_LOGIC;
		Full			: 	out	STD_LOGIC; 
		AlmostEmpty	: 	out 	STD_LOGIC;
		AlmostFull	:	out 	STD_LOGIC;
		Addr			:	out 	STD_LOGIC_VECTOR(3 downto 0);
		Write_enable: 	out 	STD_LOGIC_VECTOR(0 downto 0));
	end component;

	-- Declare memory component
	component memory port(
		clka			: IN  	std_logic;
		wea			: IN  	std_logic_vector(0 downto 0);
		addra			: IN  	std_logic_vector(3 downto 0);
		dina			: IN  	std_logic_vector(3 downto 0);
		douta			: OUT  	std_logic_vector(3 downto 0));
	end component;

	-- Declare internal signals
	signal tmp_enable	:	STD_LOGIC_VECTOR(0 downto 0);
	signal tmp_addr	:	STD_LOGIC_VECTOR(3 downto 0);


	begin
	
		-- map the inputs and the outputs of the FSM
		FSM_part : FSM_swsto port map(
			CLK			=> CLK,
			RST 			=> RST,
			Push			=>	Push,
			Pop			=> Pop,
			Empty			=> Empty,
			Full			=> Full,
			AlmostEmpty	=> AlmostEmpty,
			AlmostFull	=>	AlmostFull,
			Addr			=>	tmp_addr,
			Write_enable=>	tmp_enable);
			
			
		-- map the inputs and the outputs of the FSM
		mem_part	:	memory port map(
			clka		=> CLK,
			wea		=>	tmp_enable,
			addra		=>	tmp_addr,
			dina		=>	NumberIN,
			douta		=>	NumberOUT);
	

end Behavioral;

