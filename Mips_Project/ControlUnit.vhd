library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control is
	port (
		opcode: in std_logic_vector(5 downto 0);
		reg_dest,branch, mem_read, mem_write, alu_src, reg_write : out std_logic;
                mem_to_reg : out std_logic_vector (1 downto 0);
                jump :out std_logic_vector(1 downto 0);
		alu_op: out std_logic_vector(1 downto 0)
	);
end control;

architecture beh of control is
begin
process(opcode)
begin
 case opcode is
  when "000000" => -- add
   reg_dest <= '1';
   mem_to_reg <= "00";
   alu_op <= "10";
   jump <= "00";
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '1';
  when "000001" => -- jr
   reg_dest <= '0';
   mem_to_reg <= "00";
   alu_op <= "10";
   jump <= "10";
   branch <= '1';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
  when "001000" =>-- addi
   reg_dest <= '0';
   mem_to_reg <= "00";
   alu_op <= "00";
   jump <= "00";
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
when "000100" => -- beq
   reg_dest <= '0';
   mem_to_reg <= "00";
   alu_op <= "01";
   jump <= "00";
   branch <= '1';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
  when "000101" => -- bne 
   reg_dest <= '0';
   mem_to_reg <= "00";
   alu_op <= "11";
   jump <= "00";
   branch <= '1';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
  when "000010" => -- j
   reg_dest <= '0';
   mem_to_reg <= "00";
   alu_op <= "00";
   jump <= "01";
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
 when "000011" =>-- jal
   reg_dest <= '1';
   mem_to_reg <= "10";
   alu_op <= "00";
   jump <= "01";
   branch <=  '0';
   mem_read <=  '0';
   mem_write <=  '0';
   alu_src <= '0';
   reg_write <=  '1';
 when "100011" =>-- lw
   reg_dest <= '0';
   mem_to_reg <= "01";
   alu_op <= "00";
   jump <= "00";
   branch <= '0';
   mem_read <= '1';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
 when "101011" => -- sw
   reg_dest <= '0';
   mem_to_reg <= "01";
   alu_op <= "00";
   jump <= "00";
   branch <= '0';
   mem_read <= '0';
   mem_write <= '1';
   alu_src <= '1';
   reg_write <= '0';
 when others =>   
    reg_dest <= '0';
    mem_to_reg <= "00";
    alu_op <= "00";
    jump <= "00";
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '0';
    reg_write <= '0';
 end case;
end process;
end beh;