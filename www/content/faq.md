+++
title = "Questions fréquentes"
+++

**🚧 En construction 🚧**

Cette page apporte des réponses aux questions les plus fréquentes. N’hésitez pas
à nous rejoindre sur [notre serveur Discord](https://discord.gg/5xR5K3nAFX) pour
en savoir davantage !


# Projet et site web

### Que veut dire \[…\] ?

Certains termes sont spécifiques à la création de dispositions clavier ou à la
typographie. Notre [lexique] permet d’y voir plus clair.


### D’où vient le nom « Ergo‑L » ?

TODO

### Pourquoi tous ces 🦆 ?

::: {.dialog}
- Coin coin ?
- Ook, ook. Ook !
:::

# Pilotes

## Linux

### Pourquoi la touche [Typo]{.kbd} fonctionne-t-elle en la maintenant pressée, alors que c’est une [touche morte] ?

Bien que la touche [Typo]{.kbd} soit qualifiée de [touche morte], elle est
implémentée en utilisant un modificateur dit « _latch_ », qui s’utilise de deux
façons :

- soit en _relachant_ [Typo]{.kbd} avant de taper la touche correspondant au
  caractère composé ;
- soit en _maintenant_ [Typo]{.kbd} enfoncée en tapant cette touche.

Exemple pour Ergo‑L :

- [1dk]{.kbd} [A]{.kbd} → `à`
- [1dk]{.kbd} (maintien) [A]{.kbd} [1dk]{.kbd} (relâche) → `à`

[lexique]: /lexique
[touche morte]: /lexique#dead-key