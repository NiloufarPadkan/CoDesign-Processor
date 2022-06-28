-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX42 is
	 port(
		 S : in STD_LOGIC_VECTOR(1 downto 0);
		 I0 : in STD_LOGIC_VECTOR(6 downto 0);
		 I1 : in STD_LOGIC_VECTOR(6 downto 0);
		 I2 : in STD_LOGIC_VECTOR(6 downto 0);
		 I3 : in STD_LOGIC_VECTOR(6 downto 0);
		 O : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end MUX42;

--}} End of automatically maintained section

architecture MUX42 of MUX42 is
begin

	 O <= I0 when (S="00") else
	 I1 when (S="01") else
	 I2 when (S="10") else
	 I3 when (S="11");
end MUX42;
