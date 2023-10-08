-- Configuração de opções do editor

local undodir = vim.fn.stdpath("cache") .. "/undodir"

vim.o.mouse          = "a"
vim.o.complete       = "."
vim.o.signcolumn     = "yes"
vim.o.completeopt    = "menu,menuone,noselect"
vim.o.wildmode       = "longest,list,full"
vim.o.undodir        = undodir
vim.o.scrolloff      = 8
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.shiftwidth     = 4
vim.o.smartindent    = true
vim.o.modeline       = true
vim.o.hidden         = true
vim.o.title          = false
vim.o.exrc           = true
vim.o.ruler          = false
vim.o.errorbells     = false
vim.o.wrap           = false
vim.o.showcmd        = false
vim.o.showmode       = false
vim.o.cursorline     = false
vim.o.number         = true
vim.o.relativenumber = true
vim.o.wildmenu       = true
vim.o.hlsearch       = false
vim.o.expandtab      = true
vim.o.swapfile       = false
vim.o.backup         = false
vim.o.undofile       = true
vim.o.incsearch      = true
vim.o.smartcase      = true
vim.o.lazyredraw     = true
vim.o.ignorecase     = false

-- Configurações de tabulação para a linguagem lua
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    group = vim.api.nvim_create_augroup("LuaTab"),
    callback = function ()
      vim.bo.tabstop     = 2
      vim.bo.softtabstop = 2
      vim.bo.shiftwidth  = 2
    end
  })
