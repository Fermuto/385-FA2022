	component lab61soc is
		port (
			clk_clk : in std_logic := 'X'  -- clk
		);
	end component lab61soc;

	u0 : component lab61soc
		port map (
			clk_clk => CONNECTED_TO_clk_clk  -- clk.clk
		);

