-- keys.lua: configurações de atalhos de teclado não relacionados a plugins.
-- Inclui alguns recursos de qualidade de vida que tornam tudo mais agradável

vim.g.mapleader = " " -- espaço for the win
vim.g.maplocalleader = "," -- quase nunca uso isso

-- Mais fácil de digitar
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Atalhos mais diretos para operações comuns
vim.keymap.set("n", "<leader>s", ":%s/")
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- Navegação entre janelas (normal)
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Navegação entre janelas (inserção)
vim.keymap.set("i", "<c-k>", "<esc><c-w>k")
vim.keymap.set("i", "<c-j>", "<esc><c-w>j")
vim.keymap.set("i", "<c-h>", "<esc><c-w>h")
vim.keymap.set("i", "<c-l>", "<esc><c-w>l")

-- Navegação entre janelas (terminal)
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")

-- Copiar e colar do clipboard do sistema
vim.keymap.set("n", "<leader>p",  "\"+p")
vim.keymap.set("n", "<leader>Y",  "\"+y$")
vim.keymap.set("n", "<leader>yy", "\"+yy")
vim.keymap.set("n", "<leader>y",  "\"+y")
vim.keymap.set("v", "<leader>y",  "\"+y")

-- Apagar texto para o registrador nulo
vim.keymap.set("n", "<leader>D",  "\"_D")
vim.keymap.set("n", "<leader>dd", "\"_dd")
vim.keymap.set("n", "<leader>d",  "\"_d")
vim.keymap.set("v", "<leader>d",  "\"_d")
vim.keymap.set("v", "<leader>p", "\"_dP")

-- Movimentação rápida mais agradável
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")

-- Movendo linhas no modo visual
vim.keymap.set("v", "J", ":m'>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m'>-2<cr>gv=gv")

-- Navegação rápida de diagnósticos
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Navegação rápida do "quickfix"
vim.keymap.set("n", "<c-n>", vim.cmd.cnext)
vim.keymap.set("n", "<c-p>", vim.cmd.cprev)

vim.keymap.set("n", "Q", "<nop>") -- comando muito ruim simplesmente
vim.keymap.set("n", "<bs>", "<c-^>zz") -- arquivo alternativo no <bs>

-- Destaca o texto copiado após operações de cópia; extraído diretamente do
-- excelente kickstart.nvim
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('hl-yank', {}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
