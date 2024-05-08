-- options.lua: configura opções nativas do editor, essa é provavelmente uma
-- das partes mais importantes da config. Às vezes eu me esqueço que as opções
-- aqui não são o padrão

-- Suporte a mouse; o botão direito estende seleções visuais
vim.o.mouse      = "a"
vim.o.mousemodel = "extend"

-- Visual mais limpo e mínimo da interface
vim.o.cmdheight   = 0
vim.o.laststatus  = 3
vim.o.tabstop     = 2
vim.o.shiftwidth  = 2
vim.o.scrolloff   = 10
vim.o.report      = 100
vim.o.updatetime  = 250
vim.o.timeoutlen  = 500
vim.o.title       = false
vim.o.ruler       = false
vim.o.errorbells  = false
vim.o.wrap        = false
vim.o.showcmd     = false
vim.o.showmode    = false
vim.o.hidden      = true
vim.o.rnu         = true
vim.o.number      = true
vim.o.splitright  = true
vim.o.splitbelow  = true
vim.o.cursorline  = true
vim.o.equalalways = true
vim.o.signcolumn  = "number"
vim.o.culopt      = "number"
vim.opt.shortmess:append "ISWs"

-- Configurações de pesquisa e preenchimento automático
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.incsearch   = true
vim.o.hlsearch    = false
vim.o.wildmenu    = true
vim.o.complete    = "."
vim.o.completeopt = "menu,menuone,noselect"
vim.o.wildmode    = "longest,list,full"

-- Indentação padrão; tabs exibidas como 4 espaços
vim.o.tabstop    = 4
vim.o.shiftwidth = 4
vim.o.expandtab  = true

-- Arquivos de histórico persistente em vez de backups e swaps
vim.o.undodir  = vim.fn.stdpath("cache") .. "/undodir"
vim.o.swapfile = false
vim.o.backup   = false
vim.o.undofile = true
