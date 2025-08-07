-- keys.lua: configurações de atalhos de teclado não relacionados a plugins.
-- Inclui alguns recursos de qualidade de vida que tornam tudo mais agradável

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local u = require("eduardo.core.utils")
local term = require("eduardo.core.terminal")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<tab>", "gt")
vim.keymap.set("n", "<s-tab>", "gT")
vim.keymap.set("n", "<bs>", "<c-^>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("i", "<c-a>", "<esc>I")
vim.keymap.set("i", "<c-e>", "<esc>A")

vim.keymap.set("n", "<c-q>", vim.cmd.copen)
vim.keymap.set("n", "<c-n>", vim.cmd.cnext)
vim.keymap.set("n", "<c-p>", vim.cmd.cprev)
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>s", ":%s/")
vim.keymap.set("n", "<leader>e", ":e %:h/")
vim.keymap.set("n", "<leader>n", ":tabnew|tcd ~/Projetos/")

-- Cópia e cola ----------------------------------------------------------------

vim.keymap.set("n", "<leader>p",  '"+p')
vim.keymap.set("v", "<leader>p",  '"_dP')

vim.keymap.set("n", "<leader>y",  '"+y')
vim.keymap.set("v", "<leader>y",  '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>Y",  '"+y$')

vim.keymap.set("n", "<leader>d",  '"_d')
vim.keymap.set("v", "<leader>d",  '"_d')
vim.keymap.set("n", "<leader>dd", '"_dd')
vim.keymap.set("n", "<leader>D",  '"_D')

-- Navegação entre janelas -----------------------------------------------------

vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("i", "<c-k>", "<esc><c-w>k")
vim.keymap.set("i", "<c-j>", "<esc><c-w>j")
vim.keymap.set("i", "<c-h>", "<esc><c-w>h")
vim.keymap.set("i", "<c-l>", "<esc><c-w>l")
vim.keymap.set("t", "<c-k>", term.esc .. "<c-w>k")
vim.keymap.set("t", "<c-j>", term.esc .. "<c-w>j")
vim.keymap.set("t", "<c-h>", term.esc .. "<c-w>h")
vim.keymap.set("t", "<c-l>", term.esc .. "<c-w>l")

-- Terminal --------------------------------------------------------------------

vim.keymap.set("t", "<esc>", term.esc)
vim.keymap.set("t", "<a-l>", "<c-l>")
vim.keymap.set("t", "<a-k>", "<c-k>")
vim.keymap.set("n", "<leader>t", term.open)
vim.keymap.set("n", "<leader>r", function() term.send "!!" end)
vim.keymap.set("n", "<leader>T", "<cmd>tabnew|terminal<cr>")

-- Utilitários -----------------------------------------------------------------

vim.keymap.set("n", "<leader><bs>", u.trim)
vim.keymap.set("n", "<leader>*", u.padline)
