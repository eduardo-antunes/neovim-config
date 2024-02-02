#!/usr/bin/env bash
# .bash_aliases: atalhos convenientes em bash, simplificando tarefas comuns.
# Inclui atalhos para a administração geral de sistemas e para o git.

shopt -s autocd # a vida é muito curta pra digitar cd o tempo todo
alias vi='nvim'
alias rm='rm -I'
alias la='ls -A'
alias lh='ls -lh'
alias ll='ls -lAh'
alias open='xdg-open'
alias hrg='history | rg'
alias hgrep='history | grep'

alias gits='git status'
alias gitp='git log --pretty --oneline --graph --all'
alias cg='cd `git rev-parse --show-toplevel`' # retorna à raiz do repositório

mcd() {
    # Melhor coisa desde a invenção do pão de forma
    [ -d $1 ] || mkdir -p $1
    cd $1
}
