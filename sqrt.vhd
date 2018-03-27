-----------------------------------------------------------------------
--  RAIZ QUADRADA
-----------------------------------------------------------------------
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;

entity sqrt is                  
      generic(N: integer := 16);
      port( valor:        in  std_logic_vector( (N-1) downto 0);
            clock,reset : in  std_logic; 
            endop :       out std_logic;
            sqrt :        out std_logic_vector( (N/2-1) downto 0));
end;

architecture rtl of sqrt is   
   type State_type is (inicializa, desloca, calc, fim);
   signal EA: State_type;
   
   signal iteracoes : std_logic_vector(8 downto 0);  -- suficiente... generalizar ... 
   
   signal raiz, diferenca : std_logic_vector((N-1) downto 0); 
   signal reg: std_logic_vector((N*2-1) downto 0);
   signal sinal : std_logic;
     
begin      
   
   -- parte alta  **menos**  a raiz concatenada com "01"
   diferenca <=  reg((N*2-1) downto N) - ( raiz((N-3) downto 0) & "01");   
      
   process(clock)
   begin    
     if clock'event and clock='1' then     
            if EA=inicializa then 
                reg((N*2-1)  downto (N+2)) <= (others=>'0');
                reg((N+1)    downto 2)      <= valor;           
                reg(1         downto 0)      <= "00";  
                raiz <= (others=>'0');
                sinal <=  '0';   
                iteracoes <= (others=>'0');
            elsif EA=calc then  
                -- se a subtracao resultar em valor positivo substitui a parte alta de reg
                if diferenca(N-1)='0' then  reg((N*2-1) downto N)<=diferenca;  end if;
                sinal <=  not diferenca(N-1);   
                iteracoes <= iteracoes+1;
            elsif EA=desloca then
                reg  <= reg((N*2-3) downto 0) & "00";
                raiz <= raiz((N-2) downto 0) & sinal;
            end if;          
        end if;       
    end process;
 
   -- maquina de estados para controlar a raiz quadrada
   process (reset, clock)
      begin
       if reset='0'then
                EA <= inicializa;
                endop <= '0';
       elsif clock'event and clock='0' then  
           case EA is
                when inicializa =>  EA <= calc; 
                when calc       =>  EA <= desloca;
                when desloca    =>  if iteracoes=(N/2) then  -- metade do número de bits
                                       EA <= fim; 
                                       sqrt <= raiz((N/2-1) downto 0);
                                       endop <= '1';
                                    else 
                                       EA <= calc;  
                                    end if;
                when fim       =>   EA <= fim;    
                                    endop <= '0';

         end case; 
       end if;
   end process; 
   
end rtl;