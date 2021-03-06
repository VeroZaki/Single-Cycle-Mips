library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity memory is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead,ck: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0)
	);
end memory;


architecture behavioral of memory is	  

type mem_array is array(0 to 4095) of STD_LOGIC_VECTOR (7 downto 0);

signal data_mem: mem_array ;

begin

read_data(31 downto 24) <= data_mem(conv_integer(address(12 downto 0)))(7 downto 0) when MemRead = '1' else X"00";
read_data(23 downto 16) <= data_mem(conv_integer(address(12 downto 0))+1) (7 downto 0)when MemRead = '1' else X"00";
read_data(15 downto 8) <= data_mem(conv_integer(address(12 downto 0))+2)(7 downto 0) when MemRead = '1' else X"00";
read_data(7 downto 0) <= data_mem(conv_integer(address(12 downto 0))+3) (7 downto 0)when MemRead = '1' else X"00";
mem_process: process(address, write_data,ck)
begin
	if ck = '0' and ck'event then
		if (MemWrite = '1') then
      data_mem(conv_integer(address(12 downto 0)))(7 downto 0) <= write_data(31 downto 24);
      data_mem(conv_integer(address(12 downto 0))+1) (7 downto 0)<= write_data(23 downto 16);
      data_mem(conv_integer(address(12 downto 0))+2) (7 downto 0)<= write_data(15 downto 8);
      data_mem(conv_integer(address(12 downto 0))+3) (7 downto 0)<= write_data(7 downto 0);
		end if;
	end if;
end process mem_process;

end behavioral;