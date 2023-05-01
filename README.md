Essa é a minha configuração do [neovim](https://neovim.io/), um editor de texto livre de terminal.

A versão mínima do neovim requerida para esta configuração é a 0.8. Tendo cumprido esse requisito na instalação do programa, clone esse repositório no diretório correto usando os seguintes os comandos:

```sh
$ mkdir -p ~/.config/nvim
# Clone diretamente com o git:
$ git clone https://github.com/eduardo-antunes/neovim-config ~/.config/nvim
# Ou com a CLI oficial do github:
$ gh repo clone eduardo-antunes/neovim-config ~/.config/nvim
```

Então, instale o [packer](https://github.com/wbthomason/packer.nvim) e siga as instruções dos desenvolvedores para instalar versões atualizadas dos plugins que eu utilizo. É recomendado também instalar os programas ripgrep e fd, assim como servidores LSP.
