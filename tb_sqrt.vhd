library ieee;
use ieee.std_logic_1164.all;

entity tb_sqrt is
end tb_sqrt;

architecture TB_SQRT of tb_sqrt is

   signal clock,reset,endop : std_logic;
   signal valor             : std_logic_vector (15 downto 0);
   signal sqrt_out          : std_logic_vector (7 downto 0);

begin

     UUT : entity work.sqrt
      port map ( valor => valor, clock => clock,
                            reset => reset, endop => endop, sqrt => sqrt_out );

   reset <= '0', '1' after 70 ns;

   process                          -- generates the clock signal
        begin
        clock <= '1', '0' after 10 ns;
        wait for 20 ns;
    end process;

   valor <= "0000000000000100";

end TB_SQRT;
