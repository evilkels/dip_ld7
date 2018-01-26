library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP0 is
    Port ( CLK : in  STD_LOGIC;
           NRESET : in  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           R : out  STD_LOGIC;
           G : out  STD_LOGIC;
           B : out  STD_LOGIC);
end TOP0;

architecture Behavioral of TOP0 is
	component VGA_DRIVER_TOP 
		port (
			CLK : in  STD_LOGIC;
           NRESET : in  STD_LOGIC;
           RIN : in  STD_LOGIC;
           GIN : in  STD_LOGIC;
           BIN : in  STD_LOGIC;
           HSYNC : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           R : out  STD_LOGIC;
           G : out  STD_LOGIC;
           B : out  STD_LOGIC;
           H_OUT_VAL : out  STD_LOGIC_VECTOR (10 downto 0);
           V_OUT_VAL : out  STD_LOGIC_VECTOR (10 downto 0)
		);
	end component;
	
	component COUNTER_DIVIDER
		port (
			CLK,NRESET: in STD_LOGIC;
			CNT:out STD_LOGIC
		);
	end component;
	
	component COUNTER
	generic(N : integer := 10);
			port(CLK,NRESET,EN : in STD_LOGIC;
			CNT:out STD_LOGIC_VECTOR (N downto 0)
		);
	end component;

	signal Rin_Top:std_logic := '0';
	signal Gin_Top:std_logic := '0';
	signal Bin_Top:std_logic := '1';
	signal H_VAL_TOP_OUT:STD_LOGIC_VECTOR (10 downto 0);
	signal V_VAL_TOP_OUT:STD_LOGIC_VECTOR (10 downto 0);
	signal ROM_RED_0_out:STD_LOGIC_VECTOR (2 downto 0);
	signal ROM_GREEN_0_out:STD_LOGIC_VECTOR (2 downto 0);
	signal ROM_BLUE_0_out:STD_LOGIC_VECTOR (2 downto 0);
	signal COUNTER_DIVIDER_out:std_logic;
	signal PX_VAL:STD_LOGIC_VECTOR (8 downto 0);
	signal COUNTER_ENABLED:std_logic := '1';

begin
	COUNTER_DIVIDER_0:COUNTER_DIVIDER port map(
		CLK => CLK,
		NRESET => NRESET,
		CNT => COUNTER_DIVIDER_out
	);
	
	COUNTER_PX:COUNTER
	generic map(N => 8)
	port map(
		EN => COUNTER_ENABLED,
		CLK => COUNTER_DIVIDER_out,
		NRESET => NRESET,
		CNT => PX_VAL
	);

	VGA_DRIVER_TOP_0:VGA_DRIVER_TOP port map(
		CLK => CLK,
		NRESET => NRESET,
		Rin => Rin_Top,
		Gin => Gin_Top,
		Bin => Bin_Top,
		HSYNC => HSYNC,
		VSYNC => VSYNC,
		R => R,
		G => G,
		B => B,
		H_OUT_VAL => H_VAL_TOP_OUT,
		V_OUT_VAL => V_VAL_TOP_OUT
	);
end Behavioral;

