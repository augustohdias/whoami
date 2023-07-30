---
type: BlogPost
date: 30-07-2023
title: Jekyll, mas com Haskell
---

# [guto@space ~] stack new whoareu

## Como começou?

Esse projeto começou com uma tentativa de fazer um SPA em Elm e acabou virando uma das coisas mais divertidas que fiz nos últimos tempos.

## Nostalgia...

Eu lembro que desde moleque eu adorava brincar com a customização de blogs. Primeiro veio o blogspot, onde eu não compartilhava nada e passava a maior parte do tempo mudando o layout e as cores do tema. Depois veio o tumblr, nessa época eu já era um pouco mais velho e conseguia entender melhor como html funcionava. Eu passava horas procurando algum tema que eu gostasse em blogs de amigos e depois mais horas ainda editando e parametrizando tudo.

Talvez essas épocas tenham sido as maiores influências para eu ter seguido carreira como programador.

## Twitter vs. Threads

Recentemente, com toda essa onda de migrar de uma rede social para outra e mais uma pitada de saudade da internet dos anos 2000, eu acabei ficando com muita vontade de criar um blog, mas por algum motivo só pensar em usar qualquer plataforma para hospedagem me fazia logo descartar a ideia. Mas felizmente, graças à página [makefronendshitagain](https://makefrontendshitagain.party) eu finalmente consegui a inspiração que tava faltando.


## Elm -> Jekyll -> Haskell

Juntei a vontade de programar em alguma linguagem funcional e fui brincar com `Elm`. Até então eu não tinha me ligado que outras pessoas têm blogs hospedados no github e que já existem ferramentas para fazer isso. Foi aí que eu descobri o Jekyll.

Quando descobri que o que o Jekyll fazia era exatamente o que eu queria, decidi avançar com a minha ideia e fazer algo parecido: Uma ferramenta para criar o proprio blog ao alcance de 2 comandos. 

Foi aí então que criei o whoareu. O whoareu é uma ferramenta CLI que gera `HTML` estático a partir de arquivos `Markdown` e estrutura os resultados como blog. Por enquanto as features implementadas são:

- Criar a estrutura de um novo blog: `whoareu init`
- Gerar o `HTML` do blog: `whoareu build`

Planejo adicionar coisas como suporte a temas, live-update e ferramentas para publicação multi-plataforma.

Por enquanto é isso, o [whoareu](https://github.com/augustohdias/whoareu) é livre para uso e contribuição, fiquem a vontade e divirtam-se!

