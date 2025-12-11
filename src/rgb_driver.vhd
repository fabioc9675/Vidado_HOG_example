
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity rgb_driver is
  Port (rgb_in  : in  std_logic_vector(5 downto 0);
        rgb_out : out std_logic_vector(5 downto 0));
end rgb_driver;

architecture Behavioral of rgb_driver is

begin

    process (rgb_in)
    begin
        case rgb_in is
            when X"0A" => rgb_out <= "001001";
            when X"0B" => rgb_out <= "010010";
            when X"0C" => rgb_out <= "100100";
            when X"0D" => rgb_out <= "011011";
            when X"0E" => rgb_out <= "101101";
            when X"0F" => rgb_out <= "110110";
            when others => rgb_out <= rgb_in;
        end case;
    end process;

end Behavioral;
