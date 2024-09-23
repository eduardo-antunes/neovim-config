-- plugins/init.lua: declara os plugins que eu utilizo, usando o package.lua
-- (meu gerenciador de plugins simples) para instalá-los e configurá-los

require("eduardo.core.package").setup {

  { -- Minha humilde statusline. Sem ícones e sem cores
    "eduardo-antunes/plainline",
    config = function ()
      vim.cmd.hi "clear StatusLine"
      vim.cmd.hi "link StatusLine StatusLineNC"
    end,
    opts = {},
  },

  -- Infere o estilo de indentação a partir dos arquivos, uma solução bem
  -- mais elegante do que gravar em pedra o estilo de cada linguagem
  { "NMAC427/guess-indent.nvim", opts = {} },

  -- Substitui alguns elementos tradicionais da interface com o uso do
  -- telescope.nvim e de janelas 'floating'
  { "stevearc/dressing.nvim", opts = {} },

  { -- Essa é na verdade uma coleção de pequenos plugins, todos de uso bem
    -- específico, mas muito úteis
    "echasnovski/mini.nvim",
    config = function ()
      -- Equilibra delimitadores automaticamente, o que para mim é realmente
      -- uma necessidade básica. Similar ao electric-pair do emacs
      require("mini.pairs").setup()

      -- Oferece operações extras sobre delimitadores. É portanto similar ao
      -- vim-surround do tpope, embora não seja "retrocompatível" com ele (os
      -- atalhos são diferentes, mas são também lógicos)
      require("mini.surround").setup()

      -- Atalhos para movimentar seleções arbitrárias de texto por um arquivo;
      -- substitui alguns dos meus atalhos mais úteis e confusos
      require("mini.move").setup()

      -- Atalhos e funções para alinhar texto verticalmente. Eu adoro fazer
      -- isso, e me deixa bem satisfeito que não dê mais trabalho
      require("mini.align").setup()

      -- Expande o sistema de preenchimento ("completion") nativo do vim,
      -- tornando-o automático e integrando com LSP. Muito leve e simples
      -- quando comparado a alternativas como o nvim-cmp, e já me atende bem
      require("mini.completion").setup()
    end
  },

  -- Plugins de configuração mais extensa são declarados em arquivos
  -- separados, para manter uma organização mais modular
  { require = "eduardo.plugins.oil" },
  { require = "eduardo.plugins.treesitter" },

  -- Telescope e suas dependências
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { require = "eduardo.plugins.telescope" },
}
