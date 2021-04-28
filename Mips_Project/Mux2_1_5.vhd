library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2_1_5 is
	port(x,y: in std_logic_vector (4 downto 0);
	     s: in std_logic;
	     z: out std_logic_vector (4 downto 0)
	     );
end Mux2_1_5;

architecture dataflow of Mux2_1_5 is
begin
	z<= x when s='0' else
		y;
end dataflow;