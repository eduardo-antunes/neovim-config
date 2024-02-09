#!/usr/bin/env bash
# .bash_aliases: atalhos convenientes em bash, simplificando tarefas comuns.
# Inclui atalhos para a administração geral de sistemas e para o git.

shopt -s autocd # a vida é muito curta pra digitar cd o tempo todo
export EDITOR='nvim'
alias vi='nvim'
alias rm='rm -I'
alias la='ls -A'
alias lh='ls -lh'
alias ll='ls -lAh'
alias hrg='history | rg'
alias hgrep='history | grep'
alias ls='ls --group-directories-first --color=auto'

alias gits='git status'
alias gitp='git log --pretty --oneline --graph --all'
alias cg='cd `git rev-parse --show-toplevel`' # retorna à raiz do repositório

mcd() {
    # Melhor coisa desde a invenção do pão de forma
    if [ $# -lt 1 ]; then
        echo 'Modo de uso: mcd <dir>, equivale a mkdir + cd'
        return 1
    fi
    [ -d "$1" ] || mkdir -p "$1"
    cd "$1"
}

open() {
    # Comando ocasionalmente útil
    if [ $# -lt 1 ]; then
        echo 'Modo de uso: open <arq>, abre o arquivo no aplicativo correto'
        return 1
    fi
    xdg-open "$1" &> /dev/null &
    disown
}
