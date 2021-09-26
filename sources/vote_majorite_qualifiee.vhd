-------------------------------------------------------------------------------
--
-- vote_majorite_qualifiee.vhd
--
-- Pierre Langlois
-- v. 1.0, 2021-09-26
--
-- Le problème du vote à majorité qualifiée avec plusieurs catégories de membres votants.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.math_real.all;

entity vote_majorite_qualifiee is
    generic (
        N_juges : positive;
        N_senateurs : positive;
        N_deputes : positive
    );
    port (     
        votes_juges : in std_logic_vector(N_juges - 1 downto 0);
        votes_senateurs : in std_logic_vector(N_senateurs - 1 downto 0);
        votes_deputes : in std_logic_vector(N_deputes - 1 downto 0);
        approbation : out std_logic
    );
end vote_majorite_qualifiee;


-------------------------------------------------------------------------------
--
-- code à compléter
--
architecture arch_equations_345 of vote_majorite_qualifiee is  
begin

    assert N_juges = 3 and N_senateurs = 4 and N_deputes = 5
        report "Cette architecture ne fonctionne que pour le cas (3, 4, 5)." severity failure;
    
    approbation <= '0';

end arch_equations_345;


-------------------------------------------------------------------------------
--
-- code à compléter
--
architecture arch_flot_donnees_456 of vote_majorite_qualifiee is  
begin
    
    assert N_juges = 4 and N_senateurs = 5 and N_deputes = 6
        report "Cette architecture ne fonctionne que pour le cas (4, 5, 6)." severity failure;

    approbation <= '0';

end arch_flot_donnees_456;


-------------------------------------------------------------------------------
--
-- code à compléter
--
architecture arch_comportementale of vote_majorite_qualifiee is
begin
    
    approbation <= '0';

end arch_comportementale;
