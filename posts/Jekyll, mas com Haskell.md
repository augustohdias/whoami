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

## Tool a :: Jekyll a -> Haskell a

Juntei a vontade de programar em alguma linguagem funcional com a nostalgia da internet dos anos 2000 e fui brincar com `Elm`. Fiz o layout do blog e comecei a pensar que seria muito interessante se meus posts fossem arquivos `Markdown` processados pela SPA em Elm para construir a página.

Até então eu ainda não tinha me ligado que outras pessoas têm blogs hospedados no github e que já existem ferramentas para fazer isso. Foi aí que eu descobri o Jekyll.

Quando descobri que o que o Jekyll fazia era exatamente o que eu queria, decidi ~~usar o Jekyll~~ fazer um igual do zero: Uma ferramenta para criar e publicar no próprio blog ao alcance de 2 comandos. 

Foi aí que surgiu o whoareu. O whoareu é uma ferramenta CLI que gera `HTML` estático a partir de arquivos `Markdown` e estrutura as páginas geradas como blog. Por enquanto as features implementadas são:

- Criar a estrutura de um novo blog: `whoareu init`
- Gerar o `HTML` do blog: `whoareu build`

Planejo adicionar coisas como suporte a temas, live-update, suporte para interações (comentários e likes), tagging e ferramentas para publicação multi-plataforma no futuro.

Por enquanto é isso, o [whoareu](https://github.com/augustohdias/whoareu) é livre para uso e contribuição, fiquem a vontade e divirtam-se!

