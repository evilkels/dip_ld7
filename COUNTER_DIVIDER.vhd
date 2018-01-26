library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity COUNTER_DIVIDER is
	Port(CLK,NRESET: in STD_LOGIC;
	CNT:out STD_LOGIC); 
end COUNTER_DIVIDER;

architecture Behavioral of COUNTER_DIVIDER is
	signal CntVal:std_logic_vector(1 downto 0);
begin
	counter:process(NRESET,CLK)
	begin
		if NRESET = '0' then
			CntVal <= (others => '0');
		elsif NRESET = '1' then
			if CLK = '1' and CLK'event then
				CntVal <= CntVal+'1';
			end if;
		end if;
		
		CNT <= CntVal(0);
	end process;
end Behavioral;
