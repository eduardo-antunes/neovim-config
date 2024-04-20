-- plugins/init.lua: reúne todos os plugins que precisam de pouca configuração
-- da minha parte. Acho que não compensa fazer um arquivo para cada

return {

  -- Integração simples, mas efetiva com o git
  "tpope/vim-fugitive",

  -- Infere o estilo de indentação a partir dos arquivos, uma solução bem
  -- mais elegante do que gravar em pedra o estilo de cada linguagem
  { "NMAC427/guess-indent.nvim", opts = {} },

  -- Substitui alguns elementos tradicionais da interface com o uso do
  -- telescope.nvim e de janelas 'floating'
  { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },

  -- Minha humilde statusline. Sem ícones, sem cores, cheia de personalidade
  { "eduardo-antunes/plainline", opts = {}, dev = true },

  { -- Cores bonitas, pelo bem dos meus olhos. Eu mudo essa parte às vezes,
    -- mas o onedark.nvim para mim chega bem perto da perfeição
    "navarasu/onedark.nvim",
    lazy = false, priority = 1000,
    config = function ()
      require("onedark").setup {
        style = "darker", -- fundo mais escuro
        ending_tildes = true, -- gosto do visual clássico
        highlights = { ["@constructor"] = { fmt = "NONE" } },
        code_style = { strings = "italic" },
        -- Atalho para alternar entre fundo mais claro e mais escuro
        toggle_style_key = "<leader>t",
        toggle_style_list = { "dark", "darker" },
      }
      vim.cmd.colors "onedark"
    end
  },

  { -- Adiciona guias de indentação. Bastante útil, principalmente para
    -- linguagens muito sensíveis a espaço em branco, como python
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false },
      }
    end
  },

  { -- "Um Terminal para a Todos Governar". Terminal nativo persistente e de
    -- acesso rápido, com um port da funcionalidade de compile do emacs
    "eduardo-antunes/one-terminal",
    dev = true, opts = { kind = "split" },
    keys = {
      { "<leader><cr>", function() require("one-terminal").open() end },
      { "<leader>m", function() require("one-terminal").compile() end },
      { "<leader>r", function() require("one-terminal").recompile() end },
    }
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
}
