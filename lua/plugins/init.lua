-- Plugins de configuração mínima

return {

  "sheerun/vim-polyglot", -- suporte mais completo a várias linguagens

  "tpope/vim-commentary", -- atalhos para comentar e descomentar rapidamente

  "tpope/vim-surround", -- operações rápidas sobre delimitadores

  "christoomey/vim-tmux-navigator", -- integração melhor com o tmux

  { "windwp/nvim-autopairs", config = true }, -- delimitadores balanceados

  { "stevearc/dressing.nvim", config = true }, -- melhorias estéticas na interface

  { "eduardo-antunes/plainline", config = true, dev = true }, -- statusline mais prática

  { "echasnovski/mini.completion", config = true }, -- autocompletion leve e simples

  { "echasnovski/mini.align", config = true }, -- alinhamento vertical de texto

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

  -- explorador de arquivos similar ao dired do emacs
  {
    "stevearc/oil.nvim",
    opts = { delete_to_trash = true },
    init = function ()
      vim.keymap.set("n", "-", vim.cmd.Oil)
    end
  },

  -- integração com o git, quase tão bom quanto pão de queijo
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gclog", "Gdiffsplit" },
    init = function ()
      vim.keymap.set("n", "<leader>g", ":Git ")
    end
  },
}
