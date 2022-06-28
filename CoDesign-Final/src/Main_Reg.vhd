-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Main_Reg is
	 port(
		 CLK : in STD_LOGIC;
		 LD : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(6 downto 0);
		 ZR : out STD_LOGIC;
		 ROUT : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end Main_Reg;

--}} End of automatically maintained section

architecture Main_Reg of Main_Reg is
begin

	process (CLK)
	begin
		if rising_edge(CLK) then
			if (LD = '1') then
				ROUT <= RIN;
				if(RIN = "0000000") then
					ZR <= '1';
				else
					ZR <= '0';
				end if;
			end if;
		end if;
	end process;

end Main_Reg;