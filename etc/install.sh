#!/bin/sh
# install.sh: cria links simbólicos para as configurações externas inclusas
# no repositório: alacritty, tmux e bash

mkdir -p ~/.config/alacritty
ln -s ~/.config/nvim/etc/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.config/nvim/etc/tmux.conf ~/.tmux.conf
ln -s ~/.config/nvim/etc/bash_aliases.sh ~/.bash_aliases
