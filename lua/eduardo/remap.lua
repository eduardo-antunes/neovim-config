-- Configuração de atalhos de teclado

local remap = vim.keymap.set
remap("n", "Q", "<nop>")

-- Pequenas conveniências
remap("n", "<leader>s", ":%s/")
remap("n", "<leader>w", "<c-w>")
remap("n", "<leader>r", "<c-^>")
remap("n", "<leader>e", ":e %:h/")
remap("t", "<esc>", "<c-\\><c-n>")

-- Gerenciamento de buffers
remap("n", "<leader><right>", vim.cmd.bnext)
remap("n", "<leader><left>", vim.cmd.bprev)
remap("n", "<leader>bd", vim.cmd.bdelete)

-- Copiar e colar do clipboard do sistema
remap("n", "<leader>p", "\"+p")
remap("n", "<leader>Y", "\"+y$")
remap("n", "<leader>yy", "\"+yy")
remap({"n","v"}, "<leader>y", "\"+y")

-- Apagar texto para o registrador nulo
remap("n", "<leader>D", "\"_D")
remap("n", "<leader>dd", "\"_dd")
remap({"n","v"}, "<leader>d", "\"_d")

-- Movimentação rápida mais agradável
remap("n", "<c-u>", "<c-u>zz")
remap("n", "<c-d>", "<c-d>zz")

-- Movendo linhas no modo visual
remap("v", "J", ":m\">+1<cr>gv=gv")
remap("v", "K", ":m\">-2<cr>gv=gv")

-- Lista de quickfix local
remap("n", "<leader>q", vim.cmd.lopen)
remap("n", "<leader>j", vim.cmd.lnext)
remap("n", "<leader>k", vim.cmd.lprev)

-- Lista de quickfix global
remap("n", "<c-q>", vim.cmd.copen)
remap("n", "<c-j>", vim.cmd.cnext)
remap("n", "<c-k>", vim.cmd.cprev)

-- Um autocomando simples, mas prático
local ws = vim.api.nvim_create_augroup("RemoveWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = ws, pattern = "*",
    command = [[if &ft!="text"|%s/\s\+$//e|endif]],
  })
