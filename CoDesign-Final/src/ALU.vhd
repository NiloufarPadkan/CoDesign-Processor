-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 CMD : in STD_LOGIC_VECTOR(1 downto 0);
		 IN1 : in STD_LOGIC_VECTOR(6 downto 0);
		 IN2 : in STD_LOGIC_VECTOR(6 downto 0);
		 Result : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is
begin
	process( CMD, IN1, IN2)
	variable multiplication: std_logic_vector(13 downto 0);
	begin
		case (CMD) is
		 	when "00" =>
				Result <= IN1 + IN2;
			when "01" =>
				Result <= IN1 - IN2;
			when "10" =>
				multiplication:= IN1 * IN2;
				Result<= multiplication(6 downto 0);
			when others =>
				Result <= "XXXXXXX";
			
		end case;
	end process; 

end ALU;
