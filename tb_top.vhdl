library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal start : STD_LOGIC := '0';
    signal stop : STD_LOGIC := '0';
    signal time_interval : STD_LOGIC_VECTOR (31 downto 0);
    signal delay_line_dbg : STD_LOGIC_VECTOR (31 downto 0);
    signal start_dbg : STD_LOGIC;
    signal stop_dbg : STD_LOGIC;

    component top is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               stop : in STD_LOGIC;
               time_interval : out STD_LOGIC_VECTOR (31 downto 0);
               delay_line_dbg : out STD_LOGIC_VECTOR (31 downto 0);
               start_dbg : out STD_LOGIC;
               stop_dbg : out STD_LOGIC);
    end component;
begin
    uut: top
        Port map (
            clk => clk,
            reset => reset,
            start => start,
            stop => stop,
            time_interval => time_interval,
            delay_line_dbg => delay_line_dbg,
            start_dbg => start_dbg,
            stop_dbg => stop_dbg
        );

    -- Clock generation
    clk_process : process
    begin
        while True loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Test sequence
    stimulus: process
    begin
        -- Initialize signals
        reset <= '1';
        start <= '0';
        stop <= '0';

        -- Reset pulse
        wait for 20 ns;
        reset <= '0';

        -- Start signal
        wait for 40 ns;
        start <= '1';
        wait for 10 ns;
        start <= '0';

        -- Stop signal
        wait for 60 ns;
        stop <= '1';
        wait for 10 ns;
        stop <= '0';

        -- Add more start/stop cycles for oscillation
        wait for 100 ns;
        start <= '1';
        wait for 10 ns;
        start <= '0';

        wait for 60 ns;
        stop <= '1';
        wait for 10 ns;
        stop <= '0';

        -- Wait for some time to observe the results
        wait for 200 ns;

        -- Finish simulation
        wait;
    end process;

    -- Waveform dump
    waveform: process
    begin
        report "Start Simulation";
        wait for 5 ns;
        assert false
        report "Dumping waveform"
        severity note;
        wait;
    end process;
end Behavioral;
