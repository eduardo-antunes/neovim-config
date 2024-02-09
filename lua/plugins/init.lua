-- Plugins de configuração mínima

local parsers = { "c", "cpp", "lua", "python", "go", "vimdoc" }

return {

  "sheerun/vim-polyglot", -- suporte mais completo a várias linguagens

  "tpope/vim-commentary", -- atalhos para comentar e descomentar rapidamente

  "tpope/vim-surround", -- operações rápidas sobre delimitadores

  "christoomey/vim-tmux-navigator", -- integração melhor com o tmux

  { "windwp/nvim-autopairs", config = true }, -- delimitadores balanceados

  { "echasnovski/mini.completion", config = true }, -- autocompletion leve e simples

  { "echasnovski/mini.align", config = true }, -- alinhamento vertical de texto

  { "stevearc/dressing.nvim", config = true }, -- melhorias estéticas na interface

  { "eduardo-antunes/plainline", config = true, dev = true }, -- statusline mais prática

  -- cores um pouco mais agradáveis para o dia-a-dia
  {
    "navarasu/onedark.nvim",
    config = function ()
      vim.opt.termguicolors = true
      require("onedark").setup {
        style = "darker",
        highlights = { ["@constructor"] = { fmt = "NONE" } }
      }
      require("onedark").load()
    end
  },

  -- indica níveis de indentação, bem bacana
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false },
      }
    end
  },

  -- suporte extra a linguagens, com colorização sintática mais precisa
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ft = parsers,
    config = function ()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        ensure_installed = parsers,
      }
    end
  },

  -- integração com o git, quase tão bom quanto pão de queijo
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gg", vim.cmd.Git },
      { "<leader>gc", vim.cmd.Gclog },
      { "<leader>gd", vim.cmd.Gdiffsplit },
      { "<leader>gs", "<cmd>Git status<cr>" },
      { "<leader>gu", ":Git! push -u origin " },
      { "<leader>gp", "<cmd>Git! push<cr>" },
    },
    cmd = { "G", "Git" }
  },
}
