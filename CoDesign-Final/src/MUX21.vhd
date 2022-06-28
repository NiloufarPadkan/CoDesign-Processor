-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {MUX21} architecture {MUX21}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX21 is
	 port(
		 S : in STD_LOGIC;
		 I0 : in STD_LOGIC_VECTOR(6 downto 0);
		 I1 : in STD_LOGIC_VECTOR(6 downto 0);
		 O : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end MUX21;

--}} End of automatically maintained section

architecture MUX21 of MUX21 is
begin

	 O <= I1 when (S='1') else
	 I0 when (S='0');
end MUX21;
