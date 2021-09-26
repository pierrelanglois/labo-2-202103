-----------------------------------------------------------------------
<table>
<tr>
<td><img src="figures\Polytechnique_signature-RGB-gauche_FR.png" alt="Logo de Polytechnique Montréal"></td>
<td><h2>INF3500 - Conception et réalisation de systèmes numériques
<br><br>Automne 2021
<br><br>Laboratoire #2
<br>Module combinatoire, banc d'essai et ressources du FPGA
</h2></td>
</tr>
</table>

------------------------------------------------------------------------

# Unité de vote à majorité qualifiée

------------------------------------------------------------------------

Ce laboratoire s'appuie sur le matériel suivant :
1. Les concepts couverts dans le laboratoire #1.
2. La matière du cours des semaines 2 (Technologies de logique programmable) et 3 (Modélisation et vérification de circuits combinatoires).

À la fin de ce laboratoire, vous devrez être capable de :

- concevoir un module combinatoire avec un style de description par flot de données avec des équations booléennes, par flot de données avec des énoncés concurrents plus évolués, et avec une description comportementale ;
- concevoir un banc d'essai pour vérifier qu'un module combinatoire rencontre ses spécifications;
    - utiliser des fonctions en VHDL
    - utiliser des types abstraits
    - utiliser l'énoncé _assert_
- faire la synthèse et l'implémentation du module, et programmer un FPGA pour en vérifier le fonctionnement.

## Préparatifs

- Créez un répertoire `inf3500\labo-2` dans lequel vous mettrez tous les fichiers de ce laboratoire.
- Importez tous les fichiers du laboratoire à partir de l'entrepôt Git.
- Si vous utilisez Active-HDL :
    - Créez un espace de travail (workspace) et créez un projet (design).
    - Ajoutez les fichiers dans votre projet.
    - Choisissez le module `vote_majorite_qualifiee_TB` comme `Top-Level`.
    - Lancez la simulation et observez les messages dans la console.
    - Vous pouvez créer un chronogramme, mais ce n'est pas nécessaire.
- Si vous utilisez un autre environnement, suivez des étapes similaires pour lancer la simulation et observer les résultats.

## Introduction : Le vote à majorité qualifiée

Dans la République de Polytechnie, les changements constitutionnels nécessitent une majorité qualifiée dans trois groupes d'officiels de l'État, comme suit :
- la majorité simple (50% + 1) des juges de la cours suprême;
- la majorité aux deux tiers (2 / 3 + 1) des membres du sénat;
- la majorité aux deux tiers (2 / 3 + 1) des membres de l'assemblée des députés;

Par exemple, s'il y a 9 juges, 50 sénateurs et 300 députés, alors il faut au moins 5 juges ET 34 sénateurs ET 201 députés qui votent en faveur pour que le changement constitutionnel soit fait.

## Partie 1 : Description par flot de données avec équations booléennes

Complétez la définition de l'architecture `arch_equations_345` pour le cas où le il y a trois juges, quatre sénateurs et cinq députés.

Utilisez des équations booléennes.

**N'apportez aucun changement aux noms des entités, aux noms des architectures ni à la liste des ports ni à leurs noms.**

_Conseil_: Une solution naïve consiste à faire une table de vérité avec 3 + 4 + 5 = 12 entrées, et cette table aurait donc 2 ^ 12 lignes. Une solution plus ciblée consiste à faire trois tables de vérité avec respectivement 3, 4 et 5 entrées, et à trouver une équation pour chacune. La sortie finale est le ET logique de ces trois équations.

Remettez votre fichier modifié vote_majorite_qualifiee.vhd.

## Partie 2 : Banc d'essai

Complétez le banc d'essai fourni dans le fichier vote_majorite_qualifiee_TB.vhd. Votre tâche consiste en fait à compléter la définition de la fonction `verification_approbation`.

**N'apportez aucun changement aux noms des entités, aux noms des architectures ni à la liste des ports ni à leurs noms.**

Vérifiez le fonctionnement correct de votre code de la partie 1 avec votre banc d'essai.
- Ajustez les bonnes valeurs des paramètres `generic` dans le fichier du banc d'essai : 3, 4, 5.
- Choisissez la bonne déclaration d'entité dans le fichier du banc d'essai (`UUT : entity vote_majorite_qualifiee(arch_equations_345)`) et commentez les autres lignes non nécessaires.
- Choisissez votre banc d'essai comme unité du plus haut niveau (top level).

Au besoin, corrigez votre code de la partie 1.

Remettez votre fichier modifié vote_majorite_qualifiee_TB.vhd.

## Partie 3 : Description par flot de données avec énoncés with-select ou when-else

Complétez la définition de l'architecture `arch_flot_donnees_456` pour le cas où le il y a quatre juges, cinq sénateurs et six députés.

Utilisez des énoncés `with-select` ou bien `when-else`.

**N'apportez aucun changement aux noms des entités, aux noms des architectures ni à la liste des ports ni à leurs noms.**

_Conseil_: Une solution naïve consiste à utiliser un seul énoncé qui énumère tous les cas où l'approbation doit être donnée. Il y en aura beaucoup. Une solution plus ciblée consiste à utiliser trois énoncés, un pour les juges, un pour les sénateurs et un pour les députés. La sortie finale est le ET logique du produit de ces trois énoncés.

Vérifiez le fonctionnement correct de votre code avec votre banc d'essai.
- Ajustez les bonnes valeurs des paramètres `generic` dans le fichier du banc d'essai : 4, 5, 6.
- Choisissez la bonne déclaration d'entité dans le fichier du banc d'essai (UUT : entity vote_majorite_qualifiee(arch_flot_donnees_456)) et commentez les autres lignes non nécessaires.
- Choisissez votre banc d'essai comme unité du plus haut niveau (top level).

Au besoin, corrigez votre code ainsi que votre banc d'essai. Si vous modifiez votre banc d'essai, confirmez que la vérification de votre code de la partie 1 est toujours conforme.

Remettez votre fichier modifié vote_majorite_qualifiee.vhd (un seul fichier pour les parties 1 et 3).

## Partie 4 : Synthèse et implémentation sur la carte

Confirmez que vous avez bien importé et ajouté les fichiers suivants dans votre répertoire de projet `inf3500\labo2`. Ne les modifiez pas.
- utilitaires_inf3500_pkg.vhd
- basys_3_top.xdc
- labo_2_synth_impl.tcl
- top_labo_2.vhd

Suivez les étapes suivantes pour faire la synthèse et l'implémentation de votre code :

1. Sous votre répertoire `inf3500\labo2`, créez un répertoire `synthese-implementation`.
2. Lancez une fenêtre d'invite de commande (`cmd` sous Windows) et naviguez au répertoire `inf3500\labo2\synthese-implementation`.
3. De ce répertoire, lancez Vivado en mode script avec la commande `{repertoire-d-installation-d-Vivado}\bin\vivado -mode tcl`  
où `{repertoire-d-installation-d-Vivado}` est probablement `C:\Xilinx\Vivado\2021.1` si votre système d'exploitation est Windows.
4. Dans la fenêtre, à l'invite de commande `Vivado%`, entrez une à une les commandes du fichier labo_2_synth_impl.tcl.

Consultez le fichier top_labo_2.vhd pour comprendre comment sont reliés les ports de l'UAL aux différentes ressources de la carte. On utilise entre autres les affichages à sept segments.

Vérifiez le fonctionnement correct de votre système sur la carte.

Remettez votre fichier de configuration top_labo_2.bit.

## Partie 5 : Description comportementale

Complétez la définition de l'architecture `comportementale` pour des nombres arbitraires de juges, de sénateurs et de députés.

Utilisez un énoncé `process`.

**N'apportez aucun changement aux noms des entités, aux noms des architectures ni à la liste des ports ni à leurs noms.**

Vérifiez le fonctionnement correct de votre code avec votre banc d'essai.
- Ajustez des valeurs diverses aux paramètres `generic` dans le fichier du banc d'essai, par exemple 7, 6, 10. Ne choisissez pas des valeurs trop grandes (>= 12), parce que la simulation risque de ne pas finir aujourd'hui.
- Choisissez la bonne déclaration d'entité dans le fichier du banc d'essai (`UUT : entity vote_majorite_qualifiee(arch_comportementale)`) et commentez les autres lignes non nécessaires.
- Choisissez votre banc d'essai comme unité du plus haut niveau (top level).

Au besoin, corrigez votre code et votre banc d'essai de la partie 2. Si vous modifiez votre banc d'essai, confirmez que la vérification de votre code des parties 1 et 3 est toujours conforme.

Remettez votre fichier modifié vote_majorite_qualifiee.vhd (un seul fichier pour les parties 1, 3 et 5).

## Partie 6 : Bonus - au-delà du A

**Mise en garde**. *Compléter correctement les parties 1, 2, 3, 4 et 5 peut donner une note de 17 / 20 (85%), ce qui peut normalement être interprété comme un A. Compléter le bonus demande du travail supplémentaire qui sort normalement des attentes du cours. Il n'est pas nécessaire de faire le bonus pour réussir le cours ni pour obtenir une bonne note. Il n'est pas recommandé de s'y attaquer si vous éprouvez des difficultés dans un autre cours. Le bonus propose un défi supplémentaire pour les personnes qui souhaitent s'investir davantage dans le cours INF3500 en toute connaissance de cause.*

### Partie 6A : Ressources utilisées

Faites la synthèse de votre module `vote_majorite_qualifiee` à plusieurs reprises en variant la valeur des `generic`. Notez le nombre de ressources utilisés dans chaque cas. dans la partie correspondante de votre [rapport.md](rapport.md) sous forme de tableau et de graphique.


### Partie 6B : Affichage

Dans la version du fichier top_labo_2.vhd fournie avec ce laboratoire, l'affichage quadruple à 7 segments est utilisé de façon très sommaire.

Modifiez le fichier top_labo_2.vhd ou bien ajoutez une fonction au fichier utilitaires_inf3500_pkg.vhd pour que l'affichage montre le nombre de votes positifs pour chacune des trois catégories, chacun sur un affichage différent.

Le cas échéant, remettez vos fichiers modifiés et expliquez clairement vos modifications dans votre [rapport.md](rapport.md). 

## Remise

La remise se fait directement sur votre entrepôt Git. Faites un 'push' régulier de vos modifications, et faites un 'push' final avant la date limite de la remise. Respectez l'arborescence de fichiers originale. Consultez le barème de correction pour la liste des fichiers à remettre.

**Directives spéciales :**
- Ne modifiez pas les noms des fichiers, les noms des entités, les listes des `generics`, les listes des ports ou les noms des architectures.
- Remettez du code de très bonne qualité, lisible et bien aligné, bien commenté.
- Indiquez clairement la source de tout code que vous réutilisez ou duquel vous vous êtes inspiré/e.
- Modifiez et complétez le fichier [rapport.md](rapport.md), entre autres pour spécifier quelle carte vous utilisez.

## Barème de correction

Le barème de correction est progressif. Il est relativement facile d'obtenir une note de passage (> 10) au laboratoire et il faut mettre du travail pour obtenir l'équivalent d'un A (17/20). Obtenir une note plus élevée (jusqu'à 20/20) nécessite plus de travail que ce qui est normalement demandé dans le cadre du cours et plus que les 9 heures que vous devez normalement passer par semaine sur ce cours.

Critères | Points
-------- | ------
Partie 1 : équations booléennes | 3
Partie 2 : banc d'essai | 3
Partie 3 : with-select ou when-else | 3
Partie 4 : implémentation | 2
Partie 5 : process | 4
Qualité, lisibilité et élégance du code : alignement, choix des identificateurs, qualité et pertinence des commentaires, respect des consignes de remise incluant les noms des fichiers, orthographe, etc. | 2
Pleine réussite du labo | 17

Bonus | Points
----- | ------
Partie 6A : ressources utilisées | 2
Partie 6B : affichages améliorés | 1
Maximum possible sur 20 points | 20

## Références pour creuser plus loin

Les liens suivants ont été vérifiés en septembre 2021.

- Aldec Active-HDL Manual : accessible en faisant F1 dans l'application, et accessible [à partir du site de Aldec](https://www.aldec.com/en/support/resources/documentation/manuals/).
- Tous les manuels de Xilinx :  <https://www.xilinx.com/products/design-tools/vivado/vivado-ml.html#documentation>
- Vivado Design Suite Tcl Command Reference Guide : <https://www.xilinx.com/content/dam/xilinx/support/documentation/sw_manuals/xilinx2021_1/ug835-vivado-tcl-commands.pdf>
- Vivado Design Suite User Guide - Design Flows Overview : <https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug892-vivado-design-flows-overview.pdf>
- Vivado Design Suite User Guide - Synthesis : <https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug901-vivado-synthesis.pdf>
- Vivado Design Suite User Guide - Implementation : <https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug904-vivado-implementation.pdf>
