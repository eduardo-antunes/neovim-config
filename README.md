Essa é a minha configuração pessoal do [neovim](https://neovim.io/), um editor de texto livre de terminal. Ela requer o neovim
versão 0.8, no mínimo. Para instalá-la, basta ter a versão correta do editor e executar os seguintes comandos:

```sh
$ mkdir -p ~/.config/nvim
# Clone diretamente com o git:
$ git clone https://github.com/eduardo-antunes/neovim-config ~/.config/nvim
# Ou com a CLI oficial do github:
$ gh repo clone eduardo-antunes/neovim-config ~/.config/nvim
```

É recomendável também instalar os programas `ripgrep` e `fd`. Alguns plugins do neovim os utilizam automaticamente para obter um melhor
desempenho e/ou usabilidade.
