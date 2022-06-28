-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor is
	port(
	CLK: in STD_LOGIC ;
	out0: out STD_LOGIC_VECTOR(6 downto 0);
	out1: out STD_LOGIC_VECTOR(6 downto 0);
	out2: out STD_LOGIC_VECTOR(6 downto 0);
	out3: out STD_LOGIC_VECTOR(6 downto 0)
	);
end Processor;


architecture Processor of Processor is
signal LD0, LD1, LD2, LD3, LDPC, LDIR, BUS_Sel, RST, INC, ZR0, ZR1, ZR2, ZR3: std_logic := '0';
signal S0, S1, CMD : std_logic_vector(1 downto 0):= "00";
Signal  MData, IN1, IN2, Address, ROUTIR, ROUT0, ROUT1, ROUT2, ROUT3, BUSLine, ALURes : std_logic_vector(6 downto 0):= "0000000";
begin
	
	REG0 : entity work.Main_Reg (Main_Reg)
		port map(
		CLK=>CLK,
		LD=> LD0,
		RIN=>BUSLine,
		ZR=>ZR0,
		ROUT=>ROUT0);
	
	REG1 : entity work.Main_Reg (Main_Reg)
		port map(
		CLK=>CLK,
		LD=> LD1,
		RIN=>BUSLine,
		ZR=>ZR1,
		ROUT=>ROUT1);
		
	REG2 : entity work.Main_Reg (Main_Reg)
		port map(
		CLK=>CLK,
		LD=> LD2,
		RIN=>BUSLine,
		ZR=>ZR2,
		ROUT=>ROUT2);
		
	REG3 : entity work.Main_Reg (Main_Reg)
		port map(
		CLK=>CLK,
		LD=> LD3,
		RIN=>BUSLine,
		ZR=>ZR3,
		ROUT=>ROUT3);
		
	PC_REG : entity work.PC_Reg (PC_Reg)
		port map(
		CLK=>CLK,
		LD=>LDPC,
		INC=>INC,
		CLR=>RST,
		RIN=>BUSLine,
		ROUT=>Address);
	
	IR_REG : entity work.IR_Reg (IR_Reg)
		port map(
		CLK=>CLK,
		LD=>LDIR,
		RIN=>BUSLine,
		ROUT=>ROUTIR);
		
	Memory : entity work.ROM_Memory (ROM_Memory)
		port map(
		Address=>Address,
		Data=>Mdata);
		
	MUX : entity work.MUX21 (MUX21)
		port map(
		S=>BUS_Sel,
		I0=>MData,
		I1=>ALURes,
		O=>BUSLine);
		
	MUX0 : entity work.MUX42 (MUX42)
		port map(
		S=>S0,
		I0=>ROUT0,
		I1=>ROUT1,
		I2=>ROUT2,
		I3=>ROUT3,
		O=>IN1);
		
	MUX1 : entity work.MUX42 (MUX42)
		port map(
		S=>S1,
		I0=>ROUT0,
		I1=>ROUT1,
		I2=>ROUT2,
		I3=>ROUT3,
		O=>IN2);
		
	ALU	: entity work.ALU (ALU)
		port map(
		CMD=>CMD,
		IN1=>IN1,
		IN2=>IN2,
		Result=>ALURes);
		
	Control_Unit : entity work.Control_Unit (Control_Unit)
		port map(
		ZR3=>ZR3,
		ZR2=>ZR2,
		ZR1=>ZR1,
		ZR0=>ZR0,
		CLK=>CLK,
		ROUTIR=>ROUTIR,
		RST=>RST,
		INC=>INC,
		CMD=>CMD,
		BUS_Sel=>BUS_Sel,
		LDIR=>LDIR,
		LDPC=>LDPC,
		LD3=>LD3,
		LD2=>LD2,
		LD1=>LD1,
		LD0=>LD0,
		Sel0=>S0,
		Sel1=>S1);
		
		out0<=ROUT0;
		out1<=ROUT1;
		out2<=ROUT2;
		out3<=ROUT3;

end Processor;
