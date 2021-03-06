library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
	port (
		shampt: in std_logic_vector (4 downto 0);
		in_1, in_2: std_logic_vector(31 downto 0);
		alu_control_fuct: in std_logic_vector(3 downto 0);
		zero: out std_logic;
		alu_result: out std_logic_vector(31 downto 0)
	);
end ALU;

architecture dataflow of ALU is
        signal and_op: std_logic_vector(3 downto 0):= "0000"; --0
	signal or_op: std_logic_vector(3 downto 0):= "0001";  --1
	signal add: std_logic_vector(3 downto 0):= "0010";    --2
	signal subtract_not_equal: std_logic_vector(3 downto 0):= "0011"; --3
	signal subtract: std_logic_vector(3 downto 0):= "0110";           --6
	signal set_on_less_than: std_logic_vector(3 downto 0):= "0111";   --7
        signal shiftleft : std_logic_vector (3 downto 0) :="0100";        --4
        signal shiftright : std_logic_vector (3 downto 0) :="0101";       --5
        signal jr : std_logic_vector (3 downto 0) :="1000";              --8
	        
	begin 

	alu_result <= 
		      std_logic_vector(shift_left(unsigned(in_2), to_integer(unsigned(shampt)))) when (alu_control_fuct = shiftleft) else
                      std_logic_vector(shift_right(unsigned(in_2), to_integer(unsigned(shampt)))) when (alu_control_fuct = shiftright) else
                      std_logic_vector(unsigned(in_1) + unsigned(in_2)) when(alu_control_fuct=add) else
                      std_logic_vector(unsigned(in_1)) when(alu_control_fuct=jr) else
                      std_logic_vector(unsigned(in_1) - unsigned(in_2)) when(alu_control_fuct=subtract or alu_control_fuct=subtract_not_equal)else
                      std_logic_vector(unsigned(in_1) and unsigned(in_2)) when(alu_control_fuct=and_op)else 
                      std_logic_vector(unsigned(in_1) or unsigned(in_2)) when(alu_control_fuct=or_op)else
                      "00000000000000000000000000000001" when(alu_control_fuct=set_on_less_than and in_1 < in_2) else
	              "00000000000000000000000000000000" when(alu_control_fuct=set_on_less_than);

       zero <=	'1' when(in_1/=in_2 and alu_control_fuct=subtract_not_equal) else 
			'0' when(in_1=in_2 and alu_control_fuct=subtract_not_equal) else 
			'1' when(in_1=in_2) else 
			'0';

end dataflow;
