library IEEE;	
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbitcounter is
port( Number: in std_logic_vector(0 to 3);
rst: in std_logic;
dr: in std_logic;
clk: in std_logic;
Ld: in std_logic;
output: out std_logic_vector(0 to 3) );
end fourbitcounter;

architecture Behavioral of fourbitcounter is
signal temp: std_logic_vector(0 to 3);
begin
process(clk,rst)
begin
if rst='1' then
	temp <= "0000";
	elsif ( clk'event and clk='1') then
		if Ld='1' then
		temp <= Number;
		elsif (Ld='0' and dr='0') then	
		temp <= temp + 1;
		
		elsif (Ld='0' and dr='1') then
		temp <= temp - 1;
		
		end if;
	end if;
end process;
output <= temp;
end Behavioral;