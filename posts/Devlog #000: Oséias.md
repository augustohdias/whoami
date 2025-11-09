---
type: BlogPost
date: 09-11-2025
title: DEVLOG#000: OSEIAS
---

# [guto@space ~] stack new OSEIAS

Faz aproximadamente um ano que eu estou me interessando bastante por TTRPGs. Comecei a jogar um sistema chamado IronSworn com a minha noiva e isso me deu a ideia de criar uma aplicação que automatizasse as regras do jogo: OSEIAS ( obrigado, meu amorzinho, pelo nome ♥ ).

## Open Solo Experience: IronSworn Automated System

Para os que não conhecem o que é IronSworn, trata-se de um sistema de RPG que é comumente classificado como Sandbox. O livro de regras deixa muitas coisas abertas ao jogador, trazendo apenas um direcionamento genérico de como lidar com as consequências das ações, os atributos e demais recursos propostos pelo autor.

É extremamente divertido, porém como novos jogadores de RPG sentimos atrito com - principalmente - duas coisas:

1. Registrar a campanha é muito cansativo
2. Revisar as regras, mesmo que sejam poucas, é também muito cansativo

OSEIAS é uma tentativa de aliviar esse atrito. A ideia é que o jogador registre sua experiência textualmente, invocando eventos aleatórios e movimentos via texto também. O sistema computa as consequências e o jogador pode prosseguir com o registro da fantasia.

## Arquitetura

A tentativa é de fazer com que o sistema e interface operem em paralelo se comunicando por canais de mensagens:

> TUI -msg-> Sistema -msg-> TUI

Promover esse isolamento torna fácil pensar em evoluções da interface, migrando eventualmente de uma TUI para algo mais robusto.

Do lado do sistema, a ideia é fazer com que a implementação aplique apenas operações simples: 

- Diminuir ou aumentar valores de atributos
- Invocar um movimento
- Computar uma rolagem de dados

A execução dos movimentos é composta por consequências encadeadas de maneira a viabilizar, futuramente, tanto as expansões do sistema quanto personalizações do jogador.

## E por hora é isso...

Esse pequeno projeto é a minha maneira de me manter em contato com minha linguagem favorita, Haskell. Espero fazer jus aos fãs de IronSworn e que seja recebido como uma ferramenta útil para todas as campanhas.
