Esse repositório consiste na minha configuração do [neovim](https://neovim.io/), um editor de texto livre de terminal. Ela requer o neovim
versão 0.8, no mínimo. Para instalá-la, basta ter a versão correta do editor e executar os seguintes comandos:

```sh
$ mkdir -p ~/.config/nvim
# Clone diretamente com o git:
$ git clone https://github.com/eduardo-antunes/neovim-config ~/.config/nvim
# Ou com a CLI oficial do github:
$ gh repo clone eduardo-antunes/neovim-config ~/.config/nvim
```

Além da configuração do neovim em si, esse repositório também inclui as configurações do alacritty, um emulador de terminal, e do tmux, um
multiplexador de terminal, duas ferramentas que funcionam muito bem com o editor e melhoram a experiência de usá-lo. Para ativar essas
configurações adicionais, basta executar o script `externo/install.sh`.
