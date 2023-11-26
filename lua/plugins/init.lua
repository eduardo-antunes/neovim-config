-- Plugins de configuração mínima

return {

  "sheerun/vim-polyglot", -- suporte mais completo a várias linguagens

  "tpope/vim-commentary", -- atalhos para comentar e descomentar rapidamente

  "tpope/vim-surround", -- operações rápidas sobre delimitadores

  "christoomey/vim-tmux-navigator", -- integração melhor com o tmux

  { "windwp/nvim-autopairs", config = true }, -- delimitadores balanceados

  { "eduardo-antunes/plainline", config = true, dev = true }, -- statusline mais prática

  -- alinhamento vertical rápido de texto
  {
    "echasnovski/mini.align",
    version = false, config = true
  },

  -- autocompletion mais simples e leve
  {
    "echasnovski/mini.completion",
    version = false, config = true,
  },

  -- indica níveis de indentação, bem bacana
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "┊" },
        scope = { enabled = false },
      }
    end
  },

  -- integração com o git, quase tão bom quanto pão de queijo
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gclog" },
    init = function ()
      vim.keymap.set("n", "<leader>g", ":Git ")
    end
  },
}
