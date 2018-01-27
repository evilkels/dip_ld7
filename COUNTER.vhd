library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity COUNTER is
	generic(N : integer := 10);
	Port(CLK,NRESET,EN : in STD_LOGIC;
	CNT:out STD_LOGIC_VECTOR (N downto 0));
end COUNTER;

architecture Behavioral of COUNTER is
	signal CntVal:std_logic_vector(N downto 0);
begin
	counter:process(NRESET,CLK)
		begin
			if NRESET = '0' then
				CntVal <= (others => '0');
			elsif NRESET = '1' then
				if CLK = '1' and CLK'event and EN = '1' then
					CntVal <= CntVal+'1';
				end if;
			end if;
		end process;
	CNT <= CntVal;
end Behavioral;
