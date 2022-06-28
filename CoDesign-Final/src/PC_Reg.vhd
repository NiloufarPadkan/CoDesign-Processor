-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC_Reg is
	 port(
		 CLK : in STD_LOGIC;
		 LD : in STD_LOGIC;
		 INC : in STD_LOGIC;
		 CLR : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(6 downto 0);
		 ROUT : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end PC_Reg;

--}} End of automatically maintained section

architecture PC_Reg of PC_Reg is
begin

	process(CLK,CLR)
	variable counter : std_logic_vector( 6 downto 0) := "0000000";
	begin
		if (CLR='1') then
			counter:="0000000";
		elsif rising_edge(CLK) then
			if (LD = '1') then
				counter := RIN;
			end if;
			if (INC = '1') then
				counter := counter + 1;
			end if;
		end if;
		ROUT<=counter;
	end process;

end PC_Reg;
