---------------------------------------------------------------------------------------------------
-- 
-- top_labo_2.vhd
--
-- Pierre Langlois
-- v. 1.1, 2020/09/26 pour le laboratoire #2
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;  
use work.utilitaires_inf3500_pkg.all;
use work.all;

entity top_labo_2 is
    port(
        clk : in std_logic;                         -- l'horloge de la carte à 100 MHz
        sw : in std_logic_vector(15 downto 0);      -- les 16 commutateurs
        led : out std_logic_vector(15 downto 0);    -- les 16 LED
        seg : out std_logic_vector(7 downto 0);     -- les cathodes partagées des quatre symboles à 7 segments + point
        an : out std_logic_vector(3 downto 0);      -- les anodes des quatre symboles à 7 segments + point
        btnC : in std_logic;                        -- bouton du centre
        btnU : in std_logic;                        -- bouton du haut
        btnL : in std_logic;                        -- bouton de gauche
        btnR : in std_logic;                        -- bouton de droite
        btnD : in std_logic                         -- bouton du bas
    );
end;

architecture arch of top_labo_2 is

constant N_juges : positive := 4;
constant N_senateurs : positive := 5;
constant N_deputes : positive := 6;

signal votes_juges : std_logic_vector(N_juges - 1 downto 0);
signal votes_senateurs : std_logic_vector(N_senateurs - 1 downto 0);
signal votes_deputes : std_logic_vector(N_deputes - 1 downto 0);
signal approbation : std_logic;

signal symboles : quatre_symboles;

begin
    
    -- instanciation de l'unité du vote qualifié
    UUT : entity vote_majorite_qualifiee(arch_flot_donnees_456)
        generic map (N_juges, N_senateurs, N_deputes)
        port map (votes_juges, votes_senateurs, votes_deputes, approbation);
        
    -- connexion des interfaces de la carte aux ports d'entrée de l'unité du vote
    votes_juges <= sw(14 downto 11);
    votes_senateurs <= sw(10 downto 6);
    votes_deputes <= sw(5 downto 0);
    led(0) <= approbation;
        
    -- connexion aux affichages à 7 segments
    symboles <= (not("00" & votes_juges & "00"), not("00" & votes_senateurs & '0'), not("00" & votes_deputes), not(approbation & "0000000"));
 
   -- Circuit pour sérialiser l'accès aux quatre symboles à 7 segments.
   -- L'affichage contient quatre symboles chacun composé de sept segments et d'un point.
    process(all)
	variable clkCount : unsigned(19 downto 0) := (others => '0');
	begin
        if (clk'event and clk = '1') then
			clkCount := clkCount + 1;		   
		end if;
		case clkCount(clkCount'left downto clkCount'left - 1) is 	-- L'horloge de 100 MHz est ramenée à environ 100 Hz en la divisant par 2^19
			when "00" => an <= "1110"; seg <= symboles(0);
			when "01" => an <= "1101"; seg <= symboles(1);
			when "10" => an <= "1011"; seg <= symboles(2);
			when others => an <= "0111"; seg <= symboles(3);
		end case;
    end process;
        
end arch;