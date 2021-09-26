
------------------------------------------------------------------------

# INF3500 - labo 2
# Équipe **nom-d-équipe-ici**

Membre #1 : **nom, prénom, matricule**

Membre #2 : **nom, prénom, matricule**

------------------------------------------------------------------------

## Partie 1 : Description par flot de données avec équations booléennes

Voici un lien vers notre fichier modifié : [vote_majorite_qualifiee.vhd](sources/vote_majorite_qualifiee.vhd).

## Partie 2 : Banc d'essai

Voici un lien vers notre fichier modifié : [vote_majorite_qualifiee_TB.vhd](sources/vote_majorite_qualifiee_TB.vhd).

## Partie 3 : Description par flot de données avec énoncés with-select ou when-else

Voici un lien vers notre fichier modifié : [vote_majorite_qualifiee.vhd](sources/vote_majorite_qualifiee.vhd).

## Partie 4 : Synthèse et implémentation sur la carte

**Faire un choix et garder seulement une option.**
* Nous utilisons la carte Basys 3.
* Nous utilisons la carte Nexys A7-50T.
* Nous utilisons la carte Nexys A7-100T.

Voici un lien vers notre fichier de configuration final : [top_labo_2.bit](synthese-implementation/top_labo_2.bit)

(Optionnel) Nous avons modifié le fichier principal pour l'implémentation, voici un lien vers ce fichier : [top_labo_2.vhd](sources/top_labo_2.vhd).

## Partie 5 : Description comportementale

Voici un lien vers notre fichier modifié : [vote_majorite_qualifiee.vhd](sources/vote_majorite_qualifiee.vhd).

## Partie 6: Bonus

*Faire un choix et garder seulement une option.*

Nous n'avons pas complété le bonus. Nous nous concentrons sur notre réussite dans ce cours et dans d'autres.

Nous sommes vraiment en avance dans nos études, dans ce cours et tous les autres, et nous adorons les défis dans ce cours, donc nous avons complété une ou plusieurs parties du bonus.

### Partie 6A : Ressources

Voici le nombre de ressources disponibles dans notre FPGA.

Slice LUTs | Slice Registers | F7 Muxes | F8 Muxes | Bonded IOB
---------- | --------------- | -------- | -------- | ----------
nombre? | nombre? | nombre? | nombre? | nombre?

Voici le nombre de ressources utilisées par notre unité de vote qualifié pour différentes valeurs des generics.

(juges, sénateurs, députés) | Slice LUTs | Slice Registers | F7 Muxes | F8 Muxes | Bonded IOB
--- | ---------- | --------------- | -------- | -------- | ------------
(3, 4, 5) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(3, 4, 6) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(3, 5, 6) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(4, 5, 6) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(4, 5, 7) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(4, 6, 7) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(5, 6, 7) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(5, 6, 8) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(5, 7, 8) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(6, 7, 8) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(6, 7, 9) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(6, 8, 9) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?
(7, 8, 9) | nombre?    | nombre?         | nombre?  | nombre?  | nombre?

Voici un graphe du nombre de LUT en fonction de la somme de N_juges, N_senateurs et N_deputes.

![#LUT en fonction du nombre total de votants](figures/LUT-vs-votants.png)  


### Partie 6B : Amélioration de l'affichage

Voici des liens vers nos fichiers modifiés : [top_labo_2.vhd](sources/top_labo_2.vhd) et / ou [utilitaires_inf3500_pkg.vhd](sources/utilitaires_inf3500_pkg.vhd) modifiés.

Nous avons bien commenté notre code pour indiquer clairement les modifications de la partie 6B.


## Analyse

On remarque que ...

Concernant les 'Slice LUTs', on peut voir que la relation est [linéaire, quadratique, exponentielle, etc.] ...

Concernant les 'Bonded IOB', on peut voir que la relation est [linéaire, quadratique, exponentielle, etc.] ...

Nous expliquons les courbes par ...

Nous faisons l'hypothèse que ...


## Observations et discussion générale

Dans ce laboratoire, nous avons remarqué que ...

Nous avons appris que ....

Nous avons trouvé plus difficile de ...

Nous recommandons que ...

