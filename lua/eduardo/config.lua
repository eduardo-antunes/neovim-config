-- Configuração de opções do editor

local undodir = vim.fn.stdpath("cache") .. "/undodir"

vim.g.python_highlight_space_errors = false

vim.o.mouse          = "a"
vim.o.complete       = "."
vim.o.signcolumn     = "number"
vim.o.completeopt    = "menu,menuone,noselect"
vim.o.wildmode       = "longest,list,full"
vim.o.mousemodel     = "extend"
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

-- Configurações de indentação para a linguagem lua
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    group = vim.api.nvim_create_augroup("LuaTab", {}),
    callback = function ()
      vim.bo.tabstop     = 2
      vim.bo.softtabstop = 2
      vim.bo.shiftwidth  = 2
    end
  })

-- Configurações de "concealing" e atalhos para arquivos markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = vim.api.nvim_create_augroup("MarkCon", {}),
    callback = function ()
      vim.o.conceallevel = 3
      vim.o.concealcursor = "nc"
      vim.keymap.set("v", "<c-b>", "<esc>`>a**<esc>`<i**<esc>")
      vim.keymap.set("v", "<c-i>", "<esc>`>a*<esc>`<i*<esc>")
    end
  })
