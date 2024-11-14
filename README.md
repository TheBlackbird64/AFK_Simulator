# AFK Simulator

AFK Simulator est un jeu vidéo **multijoueur** en 2D, au concept simple et unique : le but est de rester immobile, ou "AFK", pour gagner. Mais attention, les autres joueurs feront tout pour vous en empêcher !

## Description du Jeu
**Style de jeu :** Multijoueur, 3 à 10 joueurs par partie avec des parties courtes et intenses.

**Graphismes :** Style minimaliste avec des formes géométriques simples.

**Objectif :** Le premier joueur qui parvient à rester immobile pendant 2 minutes gagne la partie.

**Gameplay :**
- Les joueurs contrôlent un carré noir évoluant sur une carte restreinte contenant des murs et des zones de couleurs.
- Les joueurs peuvent ramasser sur la carte des items qui changent leur couleur (en ajoutant légèrement de rouge, de vert, ou de bleu)
- Les joueurs peut se camoufler dans les zones de couleurs en essayant d'obtenir la même couleur qu'une des zones sur la map.
- Possibilité d’éliminer les autres joueurs pour les empêcher d’atteindre l’objectif en leur tirant dessus des projectiles (avec un cooldown pour le respawn).
- Le nombre de tirs est limité, on peut ramasser des items pour en regagner.

**Potentiel d'Amélioration :**
- Nouveaux objets (par exemple, des items pour détecter les joueurs ou augmenter le temps de réapparition).
- Capacités spéciales pour les joueurs (vitesse accrue, dégâts supplémentaires).
- Un système de classement des joueurs basé sur un système de points Elo.
- Différents modes de jeu (hide&seek, ...)

## Technologies Utilisées
**Langages :** C# et GML (GameMaker Language).

**Génération Procédurale :** Utilisation d’un automate cellulaire pour optimiser la gestion des maps. Les informations sont partagées uniquement via la graine de génération, ce qui permet un rendu rapide et synchronisé.

**Optimisation :** Système de lissage des positions pour une meilleure expérience de jeu en ligne, avec gestion de plusieurs parties simultanées pour un grand nombre de joueurs.

## Télécharger le jeu

Voir les releases.

## Liens utiles

[Code du serveur](https://github.com/TheBlackbird64/Serveur-AFKSimulator)
