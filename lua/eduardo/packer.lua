-- Instalação e gerenciamento de plugins com o packer

return require("packer").startup(function ()

  use "wbthomason/packer.nvim" -- o próprio packer

  use "sheerun/vim-polyglot" -- suporte mais completo a várias linguagens

  use "neovim/nvim-lspconfig" -- configurações prontas para o lsp nativo

  use "theprimeagen/harpoon" -- marcas de navegação mais eficientes

  use "tpope/vim-surround" -- operações rápidas sobre delimitadores

  use "tpope/vim-commentary" -- atalhos para comentar e descomentar

  use "vonr/align.nvim" -- alinhamento vertical rápido de texto

  -- cores bonitas, pelo bem dos meus olhos
  use {
    "mofiqul/vscode.nvim",
    config = function ()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme "vscode"
    end
  }

  -- statusline mais agradável e prática
  use {
    "eduardo-antunes/plainline",
    config = function ()
      require("plainline").setup()
    end
  }

  -- indica níveis de indentação, bem bacana
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
        show_trailing_blankline_indent = false,
        char = "┊",
      }
    end
  }

  -- completa pares de delimitadores automaticamente
  use {
    "windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup()
    end
  }

  -- integração com o git, quase tão bom quanto pão de queijo
  use {
    "tpope/vim-fugitive",
    cmd = {"G","Git","Gclog"},
    setup = function ()
      vim.keymap.set("n", "<leader>g", ":Git ")
    end
  }

  -- fuzzy finder para seleção rápida
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    tag = "0.1.0",
  }

  -- fuzzy finder nativo para seleção ainda mais rápida
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim", run = "make",
    config = function ()
      require("telescope").load_extension("fzf")
    end
  }

  -- colorização sintática mais precisa e agradável
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    ft = {"c","cpp","go","java","lua","python","sh"},
    config = function ()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {"c","cpp","go","java","lua","python","bash"},
        highlight = { enable = true },
      }
    end,
  }

  -- elfos que digitam por você ou algo do tipo
  use {
    "hrsh7th/nvim-cmp",
    after = "nvim-lspconfig",
    requires = {
      "l3mon4d3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  }

end)
