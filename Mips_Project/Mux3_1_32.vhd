library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux3_1_32 is
	port(x,y , a: in std_logic_vector (31 downto 0);
	     s: in std_logic_vector (1 downto 0);
	     z: out std_logic_vector (31 downto 0)
	     );
end Mux3_1_32;

architecture dataflow of Mux3_1_32 is
begin
	z<= x when s="00" else
            y when s="01" else
            a;
end dataflow;