-- Instalação e gerenciamento de plugins com o packer

local bootstrap = require('eduardo.utils').ensure_packer()

return require('packer').startup(function ()

  use 'wbthomason/packer.nvim' -- o próprio packer

  use 'sheerun/vim-polyglot' -- suporte mais completo a várias linguagens

  use 'vonr/align.nvim' -- alinhamento vertical rápido

  use 'tpope/vim-surround' -- operações rápidas sobre delimitadores

  use 'tpope/vim-commentary' -- atalhos para comentar e descomentar

  use 'neovim/nvim-lspconfig' -- configurações prontas para o lsp nativo

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- muito bom

  use 'theprimeagen/harpoon' -- marcas de navegação mais eficientes

  use 'tpope/vim-fugitive' -- integração com o git, melhor que pão de queijo

  -- cores bonitas, pelo bem dos meus olhos
  use {
    'mofiqul/vscode.nvim',
    config = function ()
      vim.opt.termguicolors = true
      require('vscode').setup {}
    end
  }

  -- statusline mais bonita e informativa
  use {
    '~/Projetos/plainline',
    config = function ()
      require('plainline').setup() 
    end
  }

  -- integração com o git em buffers
  use { 
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
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

  -- caso o packer tenha sido recém-baixado
  if bootstrap then
    require('packer').sync()
  end

end)
