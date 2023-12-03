Esse repositório consiste na minha configuração do [neovim](https://neovim.io/), um editor de texto livre de terminal. Ela requer o neovim
versão 0.8, no mínimo. Para instalá-la, basta ter a versão correta do editor e executar os seguintes comandos:

```sh
$ mkdir -p ~/.config/nvim
# Clone diretamente com o git:
$ git clone https://github.com/eduardo-antunes/neovim-config ~/.config/nvim
# Ou com a CLI oficial do github:
$ gh repo clone eduardo-antunes/neovim-config ~/.config/nvim
```

É recomendável também instalar os programas `ripgrep` e `fd`. Alguns plugins do neovim os utilizam automaticamente para obter um melhor
desempenho e/ou usabilidade. O presente repositório também inclui pequenas configurações para o `alacritty` e o `tmux`, que complementam
a experiência de utilizar o editor com funcionalidades mais sofisticadas e excelente desempenho. Para instalar essas configurações, basta
executar o script `etc/install.sh`.
