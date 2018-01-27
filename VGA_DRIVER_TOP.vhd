--LD7 project VGA_DISPLAY MODULE
--Elvijs Vilkels and Raivis Ginters

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity VGA_DRIVER_TOP is
    Port ( CLK : in  STD_LOGIC;
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
           V_OUT_VAL : out  STD_LOGIC_VECTOR (10 downto 0));
end VGA_DRIVER_TOP;

architecture Behavioral of VGA_DRIVER_TOP is
	constant H_PULSE  : integer := 96;  --horiztonal sync pulse width in pixels
	constant H_BP 		: integer := 48;  --horiztonal back porch width in pixels
	constant H_PIXELS : integer := 640; --horiztonal display width in pixels
	constant H_FP		: integer := 16;  --horiztonal front porch width in pixels
	constant H_POL		: std_logic := '0'; --horiztonal front porch width in pixels


	constant V_PULSE  : integer := 2;    --vertical sync pulse width in pixels
	constant V_BP 		: integer := 29;    --vertical back porch width in pixels
	constant V_PIXELS : integer := 480;   --vertical display width in pixels
	constant V_FP		: integer := 10;    --vertical front porch width in pixels
	constant V_POL		: std_logic := '0'; --vertical front porch width in pixels

	constant H_PERIOD : integer := H_PULSE + H_BP + H_PIXELS + H_FP;
	constant V_PERIOD : integer := V_PULSE + V_BP + V_PIXELS + V_FP;
	
	signal COUNTER_DIVIDER_out:std_logic;
	signal HSYNC_VAL:STD_LOGIC_VECTOR (10 downto 0);
	signal VSYNC_VAL:STD_LOGIC_VECTOR (10 downto 0);
	signal HSYNC_RESET:std_logic;
	signal VSYNC_RESET:std_logic;
	signal VSYNC_H_PERIOD_OUT:std_logic;
	
	component COUNTER_DIVIDER
		port(
			CLK,NRESET : IN std_logic;
			CNT : OUT std_logic
		);
	end component;
	
	component COUNTER
		generic(N : integer := 10);
		port(
			CLK,NRESET,EN : IN std_logic;
			CNT : OUT STD_LOGIC_VECTOR (N downto 0)
		); 
	end component;
begin
	COUNTER_DIVIDER_0:COUNTER_DIVIDER port map(
		CLK => CLK,
		NRESET => NRESET,
		CNT => COUNTER_DIVIDER_out
	);

	COUNTER_HSYNC:COUNTER port map(
		CLK => COUNTER_DIVIDER_out,
		NRESET => HSYNC_RESET,
		EN => '1',
		CNT => HSYNC_VAL
	);
	
	COUNTER_VSYNC:COUNTER port map(
		CLK => COUNTER_DIVIDER_out,
		NRESET => VSYNC_RESET,
		EN => VSYNC_H_PERIOD_OUT,
		CNT => VSYNC_VAL
	);
	
	HSYNC_COUNTER_VAL:process(NRESET, HSYNC_VAL)
	begin
		if NRESET = '1' and H_PERIOD /= HSYNC_VAL then
			HSYNC_RESET <= '1';
		else
			HSYNC_RESET <= '0';
		end if;
	end process;
	
	VSYNC_COUNTER_VAL:process(NRESET, VSYNC_VAL)
	begin
		if NRESET = '1' and V_PERIOD /= VSYNC_VAL then
			VSYNC_RESET <= '1';
		else
			VSYNC_RESET <= '0';
		end if;
	end process;
	
	VSYNC_H_PERIOD_COMP:process(HSYNC_VAL)
	begin
		if H_PERIOD-1 = HSYNC_VAL then
			VSYNC_H_PERIOD_OUT <= '1';
		else
			VSYNC_H_PERIOD_OUT <= '0';
		end if;
	end process;
	
	HSYNC_CHECK:process(HSYNC_VAL)
	begin
		if HSYNC_VAL >= H_PIXELS + H_FP and HSYNC_VAL < H_PIXELS + H_FP + H_PULSE then
			HSYNC <= '0';
		else
			HSYNC <= '1';
		end if;
	end process;
	
	VSYNC_CHECK:process(VSYNC_VAL)
	begin
		if VSYNC_VAL >= V_PIXELS + V_FP and VSYNC_VAL < V_PIXELS + V_FP + V_PULSE then
			VSYNC <= '0';
		else
			VSYNC <= '1';
		end if;
	end process;
	
	RGB_CHECK:process(RIN, GIN, BIN)
	begin
		if HSYNC_VAL < H_PIXELS and VSYNC_VAL < V_PIXELS then
			R <= RIN;
			G <= GIN;
			B <= BIN;
		else 
			R <= '0'; 
			G <= '0'; 
			B <= '0';
		end if;
	end process;
	
	UPDATE_OUTPUT_SYNC:process(HSYNC_VAL, VSYNC_VAL)
	begin
		H_OUT_VAL <= HSYNC_VAL;
		V_OUT_VAL <= VSYNC_VAL;
	end process;
end Behavioral;