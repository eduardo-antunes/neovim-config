-- plugins.lua: declara os plugins que eu utilizo, usando o pacman (meu
-- gerenciador de plugins simples) para instalá-los e configurá-los

require("lib.pacman").setup {

  -- Infere o estilo de indentação a partir dos arquivos, uma solução bem
  -- mais elegante do que gravar em pedra o estilo de cada linguagem
  { "NMAC427/guess-indent.nvim", opts = {} },

  -- Substitui alguns elementos tradicionais da interface com o uso do
  -- telescope.nvim e de janelas 'floating'
  { "stevearc/dressing.nvim", opts = {} },

  -- Minha humilde statusline. Sem ícones, sem cores, cheia de personalidade
  { "eduardo-antunes/plainline", opts = {} },

  { -- Cores bonitas, pelo bem dos meus olhos. Eu mudo essa parte às vezes,
    -- mas o onedark.nvim para mim chega bem perto da perfeição
    "navarasu/onedark.nvim",
    opts = {
      ending_tildes = true, -- gosto do visual clássico
      highlights = { ["@constructor"] = { fmt = "NONE" } },
      code_style = { strings = "italic" },
      -- Atalho para alternar entre fundo mais claro e mais escuro
      toggle_style_key = "<leader><tab>",
      toggle_style_list = { "darker", "dark" },
    },
    config = function()
      vim.o.termguicolors = true
      vim.cmd.colors "onedark"
    end
  },

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

      -- Outra "imitação" de um clássico do tpope, dessa vez similar ao
      -- vim-commentary. Introduz atalhos para comentar e descomentar código.
      -- Nem preciso explicar porque isso é útil
      require("mini.comment").setup()

      -- Expande o sistema de preenchimento ("completion") nativo do vim,
      -- tornando-o automático e integrando com LSP. Muito leve e simples
      -- quando comparado com alternativas como o nvim-cmp, e já me atende bem
      require("mini.completion").setup()
    end
  },

  -- Plugins de configuração mais extensa são declarados em arquivos
  -- separados, para manter uma organização mais modular
  { source = "plugins.oil" },
  { source = "plugins.treesitter" },
  { source = "plugins.lspconfig" },

  -- Telescope e suas dependências
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { source = "plugins.telescope" },
}
