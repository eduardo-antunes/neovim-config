-- options.lua: configura opções nativas do editor, essa é provavelmente uma
-- das partes mais importantes da config. Às vezes eu me esqueço que as opções
-- aqui não são o padrão

-- Suporte a mouse e outras funcionalidades extras
vim.o.mouse      = "a"
vim.o.mousemodel = "extend"
vim.o.modeline   = true
vim.o.hidden     = true
vim.o.exrc       = true

-- Interface mais limpa e mínima
vim.o.tabstop    = 2
vim.o.shiftwidth = 2
vim.o.scrolloff  = 10
vim.o.title      = false
vim.o.ruler      = false
vim.o.errorbells = false
vim.o.wrap       = false
vim.o.showcmd    = false
vim.o.showmode   = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.opt.shortmess:append "I"

-- Tempos de atualização na interface
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.lazyredraw = true

-- Pesquisa ignorando capitalização, incremental e não persistente
vim.o.ignorecase = true
vim.o.smartcase  = true
vim.o.incsearch  = true
vim.o.hlsearch   = false

-- Indentação padrão
vim.o.tabstop    = 2
vim.o.expandtab  = 4
vim.o.shiftwidth = 4

-- Números de linha e símbolos
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number" -- usa a coluna de números para símbolos

-- Backups e histórico de operações de arquivos
vim.o.undodir  = vim.fn.stdpath("cache") .. "/undodir"
vim.o.swapfile = false
vim.o.backup   = false
vim.o.undofile = true

-- Menus de completion nativos
vim.o.complete    = "." -- usa apenas o arquivo atual
vim.o.completeopt = "menu,menuone,noselect"
vim.o.wildmode    = "longest,list,full"
vim.o.wildmenu    = true

-- Remove espaços em branco sobressalentes ao salvar arquivos
vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[if &ft!="text"|%s/\s\+$//e|endif]],
  group = vim.api.nvim_create_augroup("no-whitespace", {}),
})
