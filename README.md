Esse repositório consiste principalmente na minha configuração do [neovim](https://neovim.io/), um editor de texto livre de terminal. Além dela, porém, ele também
inclui uma pequena configuração para o programa [tmux](https://github.com/tmux/tmux/wiki), pois eu geralmente os utilizo juntos. Acho que eles se complementam,
que nem queijo e goiabada.

As configurações aqui presentes requerem o neovim 0.8 e o tmux 3.2, no mínimo. Para ativá-las, utilize os seguintes comandos:

```sh
$ mkdir -p ~/.config/nvim
# Clone diretamente com o git:
$ git clone https://github.com/eduardo-antunes/neovim-config ~/.config/nvim
# Ou com a CLI oficial do github:
$ gh repo clone eduardo-antunes/neovim-config ~/.config/nvim
# Para ativar a configuração de tmux:
$ ln -s ~/.config/nvim/tmux.conf ~/.tmux.conf
```

Então, instale o [packer](https://github.com/wbthomason/packer.nvim) e siga as instruções dos desenvolvedores para instalar versões atualizadas dos plugins do
neovim que eu utilizo. É recomendado também instalar os programas `ripgrep` e `fd`, assim como servidores LSP.
