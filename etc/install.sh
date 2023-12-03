#!/bin/sh
# install.sh: cria links simbólicos para as configurações externas inclusas
# no repositório, que incluem o alacritty e o tmux.

mkdir -p ~/.config/alacritty
ln -s ~/.config/nvim/etc/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.config/nvim/etc/tmux.conf ~/.tmux.conf
