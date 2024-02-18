-- Esse arquivo reúne todos os plugins que precisam de pouca configuração da
-- minha parte; simplesmente não compensa fazer um arquivo para cada um.

return {

  "tpope/vim-surround", -- operações rápidas sobre delimitadores

  "tpope/vim-commentary", -- atalhos para comentar e descomentar rapidamente

  "sheerun/vim-polyglot", -- suporte mais completo a várias linguagens

  "christoomey/vim-tmux-navigator", -- integração melhor com o tmux

  { "windwp/nvim-autopairs", config = true }, -- delimitadores balanceados

  { "echasnovski/mini.completion", config = true }, -- autocompletion leve e simples

  { "echasnovski/mini.align", config = true }, -- alinhamento vertical de texto

  { "stevearc/dressing.nvim", config = true }, -- melhorias estéticas na interface

  { "eduardo-antunes/plainline", config = true, dev = true }, -- statusline mais prática

  { -- cores mais agradáveis para o dia-a-dia
    "navarasu/onedark.nvim",
    config = function ()
      vim.opt.termguicolors = true
      require("onedark").setup {
        highlights = { ["@constructor"] = { fmt = "NONE" } }
      }
      require("onedark").load()
    end
  },

  { -- indica níveis de indentação visualmente, muito útil em python
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false },
      }
    end
  },

  { -- integração excelente com o Git, melhor que pão de queijo
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gread", "Gedit" },
    keys = { -- atalhos de teclado para o Git
      { "<leader>gg", vim.cmd.Git  },
      { "<leader>gc", vim.cmd.Gclog },
      { "<leader>gD", vim.cmd.Gdiffsplit },
      { "<leader>gd", "<cmd>Git diff<cr>" },
      { "<leader>gs", "<cmd>Git status<cr>" },
      { "<leader>gu", ":Git! push -u origin " },
      { "<leader>gp", "<cmd>Git! push<cr>" },
    },
  },
}
