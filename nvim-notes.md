## tmux

tmux new
tmux new -s [name]

<prefix> = ctrl + B

<prefix>, D -> sair deixando a sessão aberta (detach)

ctrl + D ou exit -> sair fechando a sessão (exit)


tmux attach -t [name]
tmux ls

<prefix>, " -> dividir horizontalmente
<prefix>, % -> dividir verticalmente

<prefix>, setinha -> navegar entre painéis



## Glossary
<M> = alt
<leader> = espaço
<C> = ctrl

## Keybindings
<C>
<leader> = espaço
<M-tecla> = Alt (segurando) + tecla


### Tabs (comentado)
<M-h> <M-w> Mover entre abas
<M-w> Fechar aba

### Splits
<C wq> -> Fechar janela atual
<C ws> -> Split horizontal (metade da tela na horizontal) 
<C wv> -> Split vertical (metade da tela na vertical)

### filetree
x -> marca arquivo para cortar
p -> cola arquivos marcados
a -> inicia modo insert para criação.

ctrl + x -> Abre arquivo com split horizontal
ctrl + v -> Abre arquivo com split vertical

### Fugititive (git)
:Git - Abre a tela do fugitive

a - Add/remove arquivo trackeado. Add/Remove arquivo não traqueado do git
cc - commit (abre tela de mensagem. Escreve mensagem e ZZ)


### Telescope/LSP
gD -> [g]o to [D]eclaration
gI -> [g]o to [I]mplementation
gR -> [g]o to [R]eferences

<leader>gF -> find git files
<leader>sf -> search file

K -> hover do[K]umentation (precisa ter o cursor no nome da função)

<leader>D -> type [D]efinition
