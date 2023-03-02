-- Instalação e gerenciamento de plugins com o packer

local bootstrap = require('eduardo.utils').ensure_packer()

return require('packer').startup(function ()

  use 'wbthomason/packer.nvim' -- o próprio packer

  use 'sheerun/vim-polyglot' -- suporte mais completo a várias linguagens

  use 'tpope/vim-surround' -- operações rápidas sobre delimitadores

  use 'tpope/vim-commentary' -- atalhos para comentar e descomentar

  use 'tpope/vim-fugitive' -- integração com o git, melhor que pão de queijo

  use 'neovim/nvim-lspconfig' -- configurações prontas para o lsp nativo

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- épico

  -- cores bonitas, pelo bem dos meus olhos
  use {
    'Mofiqul/vscode.nvim',
    config = function ()
      vim.opt.termguicolors = true
      require('vscode').setup {}
    end
  }

  -- completa pares de delimitadores automaticamente
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup()
    end
  }

  -- indica níveis de indentação, bem bacana
  use { 
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('indent_blankline').setup {
        show_trailing_blankline_indent = false,
        char = '┊',
      }
    end
  }

  -- fuzzy finder para seleção rápida
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    tag = '0.1.0',
  }

  -- fuzzy finder nativo para seleção ainda mais rápida
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after = 'telescope.nvim', run = 'make',
    config = function ()
      require('telescope').load_extension('fzf')
    end
  }

  -- terminal mais elegante e rápido de acessar
  use {
    'akinsho/toggleterm.nvim',
    tag = '2.4.0',
    config = function ()
      require('toggleterm').setup {
        open_mapping = '<c-\\>',
        direction = 'float',
        float_opts = {
          border = 'curved'
        }
      }
    end
  }

  -- elfos que digitam por você ou algo do tipo
  use {
    'hrsh7th/nvim-cmp',
    after = 'nvim-lspconfig',
    requires = { 
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- caso o packer tenha sido recém-baixado
  if bootstrap then
    require('packer').sync()
  end

end)
