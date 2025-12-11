----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.06.2025 19:59:00
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
    Port (gpio_in :  in  std_logic_vector(7 downto 0);
          rgb_led :  out std_logic_vector(5 downto 0);
          rst_ctl :  out std_logic );
end multiplexer;

architecture Behavioral of multiplexer is

begin   
    
    rgb_led <= gpio_in(5 downto 0);
    
    rst_ctl <= gpio_in(6);

end Behavioral;
