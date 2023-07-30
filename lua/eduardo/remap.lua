-- Configuração de atalhos de teclado

local function key_set(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs)
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","
key_set("n", "Q", "<nop>")

-- Pequenas conveniências
key_set("n", "<leader>s", ":%s/")
key_set("n", "<leader>w", "<c-w>")
key_set("n", "<leader>r", "<c-^>")
key_set("n", "<leader>e", ":e %:h/")
key_set("t", "<esc>", "<c-\\><c-n>")

-- Gerenciamento de buffers
key_set("n", "<leader><right>", vim.cmd.bnext)
key_set("n", "<leader><left>", vim.cmd.bprev)
key_set("n", "<leader>bd", vim.cmd.bdelete)

-- Copiar e colar do clipboard do sistema
key_set("n", "<leader>p", "\"+p")
key_set("n", "<leader>Y", "\"+y$")
key_set("n", "<leader>yy", "\"+yy")
key_set({"n","v"}, "<leader>y", "\"+y")

-- Apagar texto para o registrador nulo
key_set("n", "<leader>D", "\"_D")
key_set("n", "<leader>dd", "\"_dd")
key_set({"n","v"}, "<leader>d", "\"_d")

-- Movimentação rápida mais agradável
key_set("n", "<c-u>", "<c-u>zz")
key_set("n", "<c-d>", "<c-d>zz")

-- Movendo linhas no modo visual
key_set("v", "J", ":m\">+1<cr>gv=gv")
key_set("v", "K", ":m\">-2<cr>gv=gv")

-- Lista de quickfix local
key_set("n", "<leader>q", vim.cmd.lopen)
key_set("n", "<leader>j", vim.cmd.lnext)
key_set("n", "<leader>k", vim.cmd.lprev)

-- Lista de quickfix global
key_set("n", "<c-q>", vim.cmd.copen)
key_set("n", "<c-j>", vim.cmd.cnext)
key_set("n", "<c-k>", vim.cmd.cprev)

-- Um autocomando simples, mas prático
local ws = vim.api.nvim_create_augroup("RemoveWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = ws, pattern = "*",
    command = [[%s/\s\+$//e]],
  })
