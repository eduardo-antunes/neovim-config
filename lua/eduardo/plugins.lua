-- Instalação e gerenciamento de plugins com o packer

local bootstrap = require('eduardo.utils').ensure_packer()

return require('packer').startup(function ()

  -- Meta:

  use 'wbthomason/packer.nvim'

  -- Geral:

  use 'sheerun/vim-polyglot' -- suporte mais completo a várias linguagens

  use 'tpope/vim-surround' -- operações rápidas sobre delimitadores

  use 'tpope/vim-fugitive' -- integração com o git, melhor que pão de queijo

  -- cores mais bonitas, pelo bem dos meus olhos
  use {
    'Mofiqul/vscode.nvim',
    config = function ()
      vim.opt.termguicolors = true
      require('vscode').setup {}
    end
  }

  -- colorização sintática mais precisa e agradável
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
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
    after = 'telescope.nvim',
    config = function ()
      require('telescope').load_extension('fzf')
    end,
    run = 'make'
  }

  -- Programação:

  use 'tpope/vim-commentary' -- atalhos para comentar e descomentar

  use 'neovim/nvim-lspconfig' -- configurações prontas para o lsp nativo

  -- sistema de autocomplete, com integração ao lsp nativo
  use {
    'hrsh7th/nvim-cmp',
    after = 'nvim-lspconfig',
    requires = {
      -- fontes de autocomplete (sim, são muitas)
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- caso o packer tenha sido recém-baixado
  if bootstrap then
    require('packer').sync()
  end

end)
