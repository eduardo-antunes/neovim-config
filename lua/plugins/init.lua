-- Instalação e gerenciamento de plugins com lazy.nvim

return {

  "sheerun/vim-polyglot", -- suporte mais completo a várias linguagens

  "tpope/vim-commentary", -- atalhos para comentar e descomentar rapidamente

  "tpope/vim-surround", -- operações rápidas sobre delimitadores

  { "windwp/nvim-autopairs", config = true }, -- delimitadores balanceados

  { "eduardo-antunes/plainline", config = true }, -- statusline mais prática

  -- cores bonitas, pelo bem dos meus olhos
  {
    "mofiqul/vscode.nvim",
    priority = 1000,
    config = function ()
      vim.opt.termguicolors = true
      require("vscode").setup { transparent = true }
      require("vscode").load()
    end
  },

  -- indica níveis de indentação, bem bacana
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_trailing_blankline_indent = false,
      char = "┊",
    }
  },

  -- integração com o git, quase tão bom quanto pão de queijo
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gclog" },
    init = function ()
      vim.keymap.set("n", "<leader>g", ":Git ")
    end
  },

  -- colorização sintática mais precisa e agradável
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ft = { "c", "cpp", "go", "java", "lua", "python", "sh" },
    config = function ()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        ensure_installed = { "c", "cpp", "go", "java", "lua", "python", "bash" }
      }
    end
  }

}
