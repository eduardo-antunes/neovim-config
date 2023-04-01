-- Instalação e gerenciamento de plugins com o packer

return require('packer').startup(function ()

  use 'wbthomason/packer.nvim' -- o próprio packer

  use 'tpope/vim-surround' -- operações rápidas sobre delimitadores

  use 'vonr/align.nvim' -- alinhamento vertical rápido de texto

  use 'sheerun/vim-polyglot' -- suporte mais completo a várias linguagens

  use 'tpope/vim-commentary' -- atalhos para comentar e descomentar

  use 'neovim/nvim-lspconfig' -- configurações prontas para o lsp nativo

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- excelente

  use 'theprimeagen/harpoon' -- marcas de navegação mais eficientes

  use 'tpope/vim-fugitive' -- integração com o git, melhor que pão de queijo

  -- cores bonitas, pelo bem dos meus olhos
  use {
    'mofiqul/vscode.nvim',
    config = function ()
      vim.opt.termguicolors = true
      local c = require('vscode.colors')
      require('vscode').setup {
        italic_comments = true,
        group_overrides = {
          -- quem é o ser humano amargurado que fez os delimitadores serem
          -- exibidos em AMARELO por padrão? Isso devia ser crime, sério
          ['@punctuation.bracket'] = { fg = c.vscNone },
        },
      }
      require('vscode').load('dark')
    end
  }

  -- statusline mais agradável e prática
  use {
    '~/Projetos/plainline',
    config = function ()
      require('plainline').setup() 
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
