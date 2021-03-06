library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2_1_32 is
	port(x,y: in std_logic_vector (31 downto 0);
	     s: in std_logic;
	     z: out std_logic_vector (31 downto 0)
	     );
end Mux2_1_32;

architecture dataflow of Mux2_1_32 is
begin
	z<= x when s='0' else
		y;
end dataflow;