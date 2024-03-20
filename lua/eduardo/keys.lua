--# Configuração de atalhos de teclado

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set -- atalho conveniente

-- Simetria com I e A
set("n", "H", "^")
set("n", "L", "$")

-- Atalhos mais diretos para operações comuns
set("n", "<leader>s", ":%s/")
set("t", "<esc>", "<c-\\><c-n>")
set("n", "<leader>e", ":e %:h/")
set("n", "<leader>w", "<cmd>w<cr>")

-- Navegação entre janelas (normal)
set("n", "<c-k>", "<c-w>k")
set("n", "<c-j>", "<c-w>j")
set("n", "<c-h>", "<c-w>h")
set("n", "<c-l>", "<c-w>l")

-- Navegação entre janelas (inserção)
set("i", "<c-k>", "<esc><c-w>k")
set("i", "<c-j>", "<esc><c-w>j")
set("i", "<c-h>", "<esc><c-w>h")
set("i", "<c-l>", "<esc><c-w>l")

-- Navegação entre janelas (terminal)
set("t", "<c-k>", "<c-\\><c-n><c-w>k")
set("t", "<c-j>", "<c-\\><c-n><c-w>j")
set("t", "<c-h>", "<c-\\><c-n><c-w>h")
set("t", "<c-l>", "<c-\\><c-n><c-w>l")

-- Copiar e colar do clipboard do sistema
set("n", "<leader>p",  "\"+p")
set("n", "<leader>Y",  "\"+y$")
set("n", "<leader>yy", "\"+yy")
set("n", "<leader>y",  "\"+y")
set("v", "<leader>y",  "\"+y")

-- Apagar texto para o registrador nulo
set("n", "<leader>D",  "\"_D")
set("n", "<leader>dd", "\"_dd")
set("n", "<leader>d",  "\"_d")
set("v", "<leader>d",  "\"_d")

-- Movimentação rápida mais agradável
set("n", "<c-u>", "<c-u>zz")
set("n", "<c-d>", "<c-d>zz")

-- Movendo linhas no modo visual
set("v", "J", ":m\">+1<cr>gv=gv")
set("v", "K", ":m\">-2<cr>gv=gv")

-- Navegação rápida de diagnósticos
local z = { silent = true }
set("n", "[d", vim.diagnostic.goto_prev, z)
set("n", "]d", vim.diagnostic.goto_next, z)
set("n", "<leader>ll", vim.diagnostic.open_float, z)
set("n", "<leader>lq", vim.diagnostic.setloclist, z)

-- Navegação rápida do "quickfix"
set("n", "<c-q>", vim.cmd.copen)
set("n", "<c-n>", vim.cmd.cnext)
set("n", "<c-p>", vim.cmd.cprev)

set("n", "Q", "<nop>") -- comando muito ruim simplesmente
set("n", "<bs>", "<c-^>zz") -- arquivo alternativo no <bs>

-- Atalhos para o sistema de complete nativo

set("i", "<tab>", function ()
  return vim.fn.pumvisible() == 1 and "<c-n>" or "<tab>"
end, { expr = true })

set("i", "<s-tab>", function ()
  return vim.fn.pumvisible() == 1 and "<c-p>" or "<s-tab>"
end, { expr = true })
