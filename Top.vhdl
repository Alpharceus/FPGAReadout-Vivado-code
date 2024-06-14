library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           time_interval : out STD_LOGIC_VECTOR (31 downto 0);
           delay_line_dbg : out STD_LOGIC_VECTOR (31 downto 0);
           start_dbg : out STD_LOGIC;
           stop_dbg : out STD_LOGIC);
end top;

architecture Behavioral of top is
    component tdc is
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
    tdc_inst : tdc
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
end Behavioral;

