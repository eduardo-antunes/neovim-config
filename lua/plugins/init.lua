-- Esse arquivo reúne todos os plugins que precisam de pouca configuração da
-- minha parte; simplesmente não compensa fazer um arquivo para cada um.

return {

  "tpope/vim-sleuth", -- configurações de tabulação sempre corretas

  { "stevearc/dressing.nvim", opts = {} }, -- pequenas melhorias na interface

  { -- cores bonitas, pelo bem dos meus olhos
    "folke/tokyonight.nvim",
    lazy = false, priority = 1000,
    config = function ()
      vim.cmd.colors "tokyonight"
    end
  },

  { -- indica níveis de indentação visualmente
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { enabled = false },
      }
    end
  },

  { -- integração com git em buffers
    "lewis6991/gitsigns.nvim",
    opts = { numhl = true, signcolumn = false },
  },

  { -- integração excelente com o git (estou testando esse)
    "neogitorg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    config = function ()
      require("neogit").setup { kind = "replace" }
      vim.keymap.set("n", "<leader>g", function() require("neogit").open() end)
    end
  },

  { -- coleção de pequenos plugins para o neovim
    "echasnovski/mini.nvim",
    config = function ()
      -- Delimitadores sempre balanceados
      require("mini.pairs").setup {}

      -- Operações sobre delimitadores
      require("mini.surround").setup {}

      -- Alinhamento vertical de texto
      require("mini.align").setup {}

      -- Atalhos para comentários
      require("mini.comment").setup {}

      -- Preenchimento automático ("completion") leve e simples
      require("mini.completion").setup {}

      -- Statusline prática e agradável
      require("mini.statusline").setup {
        use_icons = false
      }
    end
  },
}
