-- Instalação e gerenciamento de plugins com o packer

return require('packer').startup(function ()

  use 'wbthomason/packer.nvim' -- o próprio packer

  use 'tpope/vim-surround' -- operações rápidas sobre delimitadores

  use 'vonr/align.nvim' -- alinhamento vertical rápido de texto

  use 'sheerun/vim-polyglot' -- suporte mais completo a várias linguagens

  use 'tpope/vim-commentary' -- atalhos para comentar e descomentar

  use 'neovim/nvim-lspconfig' -- configurações prontas para o lsp nativo

  use 'theprimeagen/harpoon' -- marcas de navegação mais eficientes

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- excelente

  use { 'tpope/vim-fugitive', cmd = { 'G', 'Git', 'Gclog' } } -- integração com o git

  -- cores bonitas, pelo bem dos meus olhos
  use {
    'rebelot/kanagawa.nvim',
    config = function ()
      vim.opt.termguicolors = true
      require('kanagawa').setup {
        compile = true, -- carregamento mais rápido
        statementStyle = { bold = false },
      }
      vim.cmd.colorscheme 'kanagawa'
    end
  }

  -- statusline mais agradável e prática
  use {
    '~/Projetos/pessoais/plainline',
    config = function ()
      require('plainline').setup() 
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

  -- completa pares de delimitadores automaticamente
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup()
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

  -- elfos que digitam por você ou algo do tipo
  use {
    'hrsh7th/nvim-cmp',
    after = 'nvim-lspconfig',
    requires = { 
      'l3mon4d3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
    },
  }

end)
