-- options.lua: configura opções nativas do editor
-- Também define alguns comandos automáticos simples

vim.o.hidden = true
vim.o.wrap   = false

vim.o.tabstop    = 4
vim.o.shiftwidth = 4
vim.o.expandtab  = true

vim.o.report     = 100
vim.o.updatetime = 250
vim.o.timeoutlen = 500

vim.o.mouse = "a"
vim.o.mousemodel = "extend"
vim.opt.shortmess:append "ISWc"

vim.o.cmdheight   = 0
vim.o.laststatus  = 3
vim.o.scrolloff   = 10
vim.o.ruler       = false
vim.o.showcmd     = false
vim.o.showmode    = false
vim.o.tgc         = true
vim.o.rnu         = true
vim.o.number      = true
vim.o.list        = true
vim.o.cursorline  = true
vim.o.splitright  = true
vim.o.splitbelow  = true
vim.o.equalalways = true
vim.o.signcolumn  = "number"
vim.o.lcs         = "tab:· ,trail:_"

vim.o.incsearch   = true
vim.o.hlsearch    = false
vim.o.wildmenu    = true
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.complete    = ".,w,b"
vim.o.inccommand  = "split"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.wildmode    = "longest,list,full"

vim.o.undodir  = vim.fn.stdpath("cache") .. "/undodir"
vim.o.swapfile = false
vim.o.backup   = false
vim.o.undofile = true

--------------------------------------------------------------------------------

local e = vim.api.nvim_create_augroup("eduardo", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

autocmd("ColorScheme", {
  group = e, callback = function()
    -- Eu realmente não gosto da colorização sintática que o LSP aplica
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})
