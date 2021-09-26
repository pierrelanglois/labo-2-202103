-------------------------------------------------------------------------------
--
-- vote_majorite_qualifiee_TB.vhd
--
-- banc d'essai pour vote_majorite_qualifiee.vhd
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.all;

entity vote_majorite_qualifiee_TB is
    generic (
        N_juges : positive := 3;
        N_senateurs : positive := 4;
        N_deputes : positive := 5
	);
end vote_majorite_qualifiee_TB;

architecture arch of vote_majorite_qualifiee_TB is
	
signal votes_juges : std_logic_vector(N_juges - 1 downto 0);
signal votes_senateurs : std_logic_vector(N_senateurs - 1 downto 0);
signal votes_deputes : std_logic_vector(N_deputes - 1 downto 0);
signal approbation : std_logic;

function verification_approbation(votes_juges, votes_senateurs, votes_deputes : std_logic_vector) return boolean is
begin	
    
--
-- code à compléter
--
    
    return false;

end verification_approbation;


begin

	-- instanciation du module à vérifier à l'aide d'une instantiation d'entité (VHDL LRM 2002, section 9.6.2)
    UUT : entity vote_majorite_qualifiee(arch_equations_345)
--    UUT : entity vote_majorite_qualifiee(arch_flot_donnees_456)
--    UUT : entity vote_majorite_qualifiee(arch_comportementale)
        generic map (N_juges, N_senateurs, N_deputes)
        port map (votes_juges, votes_senateurs, votes_deputes, approbation);
	
	process -- application exhaustive des vecteurs de test
	begin
		for i in 0 to 2 ** N_juges - 1 loop
			votes_juges <= std_logic_vector(to_unsigned(i, N_juges));
    		for j in 0 to 2 ** N_senateurs - 1 loop
    			votes_senateurs <= std_logic_vector(to_unsigned(j, N_senateurs));
        		for k in 0 to 2 ** N_deputes - 1 loop
        			votes_deputes <= std_logic_vector(to_unsigned(k, N_deputes));
                    wait for 10 ns;
                    
                    assert (approbation = '1') = verification_approbation(votes_juges, votes_senateurs, votes_deputes)
    				report "Erreur ! "
                        & "votes_juges : " & to_string(votes_juges) & ", "
                        & "votes_senateurs : " & to_string(votes_senateurs) & ", "
                        & "votes_deputes : " & to_string(votes_deputes) & ", "
                        & "approbation : " & to_string(approbation)
                        severity failure;

                end loop; 
            end loop;
        end loop;

		report "simulation terminée" severity failure;
		
	end process;
	
end;
