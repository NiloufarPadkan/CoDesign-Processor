---------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IR_Reg is
	 port(
		 CLK : in STD_LOGIC;
		 LD : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(6 downto 0);
		 ROUT : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end IR_Reg;

--}} End of automatically maintained section

architecture IR_Reg of IR_Reg is
begin

	process (CLK)
	begin
		if rising_edge(CLK) then
			if (LD = '1') then
				ROUT <= RIN;
			end if;
		end if;
	end process;

end IR_Reg;
