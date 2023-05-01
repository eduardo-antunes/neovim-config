-- Customização através de opções

local o = vim.opt

local undodir = vim.fn.stdpath('cache') .. '/undodir'

o.mouse          = 'a'
o.signcolumn     = 'yes'
o.undodir        = undodir
o.scrolloff      = 8
o.tabstop        = 4
o.softtabstop    = 4
o.shiftwidth     = 4
o.smartindent    = true
o.modeline       = true
o.hidden         = true
o.exrc           = true
o.ruler          = false
o.errorbells     = false
o.wrap           = false
o.showcmd        = false
o.showmode       = false
o.cursorline     = false
o.number         = true
o.relativenumber = true
o.wildmenu       = true
o.hlsearch       = false
o.expandtab      = true
o.swapfile       = false
o.backup         = false
o.undofile       = true
o.incsearch      = true
o.smartcase      = true
o.lazyredraw     = true
o.ignorecase     = false
o.completeopt    = { 'menu', 'menuone', 'noselect' }
o.wildmode       = { 'longest', 'list', 'full' }
