library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity processor_tb is
end processor_tb;

architecture TB_ARCHITECTURE of processor_tb is
	-- Component declaration of the tested unit
	component processor
	port(
		CLK : in STD_LOGIC;
		out0 : out STD_LOGIC_VECTOR(6 downto 0);
		out1 : out STD_LOGIC_VECTOR(6 downto 0);
		out2 : out STD_LOGIC_VECTOR(6 downto 0);
		out3 : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal out0 : STD_LOGIC_VECTOR(6 downto 0);
	signal out1 : STD_LOGIC_VECTOR(6 downto 0);
	signal out2 : STD_LOGIC_VECTOR(6 downto 0);
	signal out3 : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : processor
		port map (
			CLK => CLK,
			out0 => out0,
			out1 => out1,
			out2 => out2,
			out3 => out3
		);

	process
	begin
		CLK<='0';
		wait for 5ns;
		CLK<='1';
		wait for 5ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_processor of processor_tb is
	for TB_ARCHITECTURE
		for UUT : processor
			use entity work.processor(processor);
		end for;
	end for;
end TESTBENCH_FOR_processor;

