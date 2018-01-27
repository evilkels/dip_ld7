--LD7 lab darba TOP mudule
--TOP Module implements every submodule :
--	COUNTER,
--	COUNTER_DIVIDER,
--	VGA_DRIVER_TOP,
--	ROM_RED,
--	ROM_GREEN,
--	ROM_BLUE
--in TOP module all submodules are used to display functionality on
--screen and get result.
--
--Elvijs Vilkels & Raivis Ginters

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

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
	
--	 ROM RGB COMPONENTS FOR MARIO IMAGE
	COMPONENT ROM_BLUE
	  PORT (
		 a : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 clk : IN STD_LOGIC;
		 spo : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ROM_RED
	  PORT (
		 a : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 clk : IN STD_LOGIC;
		 spo : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ROM_GREEN
	  PORT (
		 a : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 clk : IN STD_LOGIC;
		 spo : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	  );
	END COMPONENT;

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
	signal Bin_Top:std_logic := '0';
	signal H_VAL_TOP_OUT:STD_LOGIC_VECTOR (10 downto 0);
	signal V_VAL_TOP_OUT:STD_LOGIC_VECTOR (10 downto 0);
	signal ROM_RED_IMAGE_out:STD_LOGIC_VECTOR (2 downto 0);
	signal ROM_GREEN_IMAGE_out:STD_LOGIC_VECTOR (2 downto 0);
	signal ROM_BLUE_IMAGE_out:STD_LOGIC_VECTOR (2 downto 0);
	signal COUNTER_DIVIDER_out:std_logic;
	signal PIXEL_VAL:STD_LOGIC_VECTOR (8 downto 0);
	signal EN_COUNTER:std_logic := '1';

begin
	COUNTER_DIVIDER_0:COUNTER_DIVIDER port map(
		CLK => CLK,
		NRESET => NRESET,
		CNT => COUNTER_DIVIDER_out
	);
	
	PIXEL_COUNTER:COUNTER
	generic map(N => 8)
	port map(
		EN => EN_COUNTER,
		CLK => COUNTER_DIVIDER_out,
		NRESET => NRESET,
		CNT => PIXEL_VAL
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
	
	ROM_RED_IMAGE:ROM_RED port map (
		a => PIXEL_VAL,
		clk => CLK,
		spo => ROM_RED_IMAGE_out
	);
	ROM_GREEN_IMAGE:ROM_GREEN port map (
		a => PIXEL_VAL,
		clk => CLK,
		spo => ROM_GREEN_IMAGE_out
	);
	ROM_BLUE_IMAGE:ROM_BLUE port map (
		a => PIXEL_VAL,
		clk => CLK,
		spo => ROM_BLUE_IMAGE_out
	);
--	#######
--	DRAW RECTANGLE PROCESS
-- #######
--	DRAW_RECT:process(H_VAL_TOP_OUT, H_VAL_TOP_OUT)
--		variable RECTANGLE_WIDTH : integer := 32;
--		variable RECTANGLE_HEIGHT : integer := 64;
--	begin
--		if H_VAL_TOP_OUT < RECTANGLE_WIDTH and H_VAL_TOP_OUT < RECTANGLE_HEIGHT then
--			Rin_Top <= '0';
--			Gin_Top <= '0';
--			Bin_Top <= '1';
--		else
--			Rin_Top <= '0';
--			Gin_Top <= '1';
--			Bin_Top <= '0';
--		end if;
--	end process;
	
--	#######
--	DRAW MARIO PROCESS
-- #######	
	
	MARIO_DRAW:process(H_VAL_TOP_OUT, H_VAL_TOP_OUT)
		variable MARIO_WIDTH : integer := 16;
		variable MARIO_HEIGHT : integer := 32;
	begin
		if H_VAL_TOP_OUT < MARIO_WIDTH and H_VAL_TOP_OUT < MARIO_HEIGHT then
			EN_COUNTER <= '1';
			Rin_Top <= ROM_RED_IMAGE_out(2);
			Gin_Top <= ROM_GREEN_IMAGE_out(2);
			Bin_Top <= ROM_BLUE_IMAGE_out(2);
		else 
			Rin_Top <= '0';
			Gin_Top <= '1';
			Bin_Top <= '0';
		end if;
	end process;	
	
end Behavioral;

