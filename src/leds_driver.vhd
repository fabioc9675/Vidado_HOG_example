----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2025 19:56:22
-- Design Name: 
-- Module Name: leds_driver - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity leds_driver is
    Port ( sws : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (3 downto 0));
end leds_driver;

architecture Behavioral of leds_driver is

    signal cnt  : integer := 0;
    signal sta1 : std_logic := '0';
    signal sta2 : std_logic := '0';
    

begin

    leds(1 downto 0) <= sws;
    
    process (clk,rst)
    begin
        if (rst = '1') then
            cnt <= 0;
        else
            if rising_edge(clk) then
                cnt <= (cnt + 1) mod 50000000; 
            end if;
            
            if (cnt = 0) then
                sta1 <= not sta1;
            end if;
            
            if (cnt mod 10000000) = 0 then
                sta2 <= (not sta2) and sta1;
            end if;            
                       
        end if;
    
    end process;
    
    leds(2) <= sta2;
    leds(3) <= sta1;

end Behavioral;
