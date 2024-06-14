library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tdc is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in STD_LOGIC;
           time_interval : out STD_LOGIC_VECTOR (31 downto 0);
           delay_line_dbg : out STD_LOGIC_VECTOR (31 downto 0);
           start_dbg : out STD_LOGIC;
           stop_dbg : out STD_LOGIC);
end tdc;

architecture Behavioral of tdc is
    constant DELAY_ELEMENTS : integer := 32;
    signal delay_line : STD_LOGIC_VECTOR(DELAY_ELEMENTS-1 downto 0);

    function interpolate(delay_line : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
        variable result : UNSIGNED(31 downto 0) := (others => '0');
    begin
        for i in 0 to DELAY_ELEMENTS-1 loop
            if delay_line(i) = '1' then
                result := to_unsigned(i * 100, 32); -- Adjust scaling factor as needed
                exit;
            end if;
        end loop;
        return STD_LOGIC_VECTOR(result);
    end function;

begin
    process(clk, reset)
    begin
        if reset = '1' then
            delay_line <= (others => '0');
            time_interval <= (others => '0');
        elsif rising_edge(clk) then
            if start = '1' then
                delay_line <= delay_line(DELAY_ELEMENTS-2 downto 0) & '1';
            elsif stop = '1' then
                time_interval <= interpolate(delay_line);
            end if;
        end if;
    end process;

    delay_line_dbg <= delay_line;
    start_dbg <= start;
    stop_dbg <= stop;
end Behavioral;
