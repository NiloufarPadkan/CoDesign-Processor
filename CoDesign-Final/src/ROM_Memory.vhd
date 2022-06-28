-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity ROM_Memory is
	 port(
		 Address : in STD_LOGIC_VECTOR(6 downto 0);
		 Data : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end ROM_Memory;

--}} End of automatically maintained section

architecture ROM_Memory of ROM_Memory is
type ROM is array ( 63 downto 0) of std_logic_vector(6 downto 0);
signal memory:ROM;
begin
	
	--Adding 7 and 4
--	memory(0) <= "000011";
--	memory(1) <= "000111";
--	memory(2) <= "000111"; 
--	memory(3) <= "000100";
--	memory(4) <= "010001";
--	memory(5) <= "000000";
	
	--Multiply 8 to 6
--	memory(0) <= "000011";
--	memory(1) <= "000000";
--	memory(2) <= "000111"; 
--	memory(3) <= "001000";
--	memory(4) <= "001011";
--	memory(5) <= "000110";
--	memory(6) <= "001111";
--	memory(7) <= "000001";
--	memory(8) <= "010001";
--	memory(9) <= "101011";
--	memory(10) <= "111000";
--	memory(11) <= "001000";
--	memory(12) <= "000000";

	--Multiply 8 to 6 with command
	memory(0) <= "0000111"; 
	memory(1) <= "0001000";
	memory(2) <= "0001011";
	memory(3) <= "0000110";
	memory(4) <= "1000110";
	memory(5) <= "0000000";
	
	
	Data <=memory(to_integer(unsigned(Address)));
	
end ROM_Memory;
