-- keys.lua: configurações de atalhos de teclado não relacionados a plugins.
-- Inclui alguns recursos de qualidade de vida que tornam tudo mais agradável

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Atalhos pequenos, porém convenientes. São coisas que eu genuinamente esqueço
-- que não são o padrão do vim, como H para ir para o começo da linha e L para
-- ir para o final
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<bs>", "<c-^>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<c-q>", vim.cmd.copen)
vim.keymap.set("n", "<c-n>", vim.cmd.cnext)
vim.keymap.set("n", "<c-p>", vim.cmd.cprev)
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>s", ":%s/")
vim.keymap.set("n", "Q", "<nop>")

-- Navegação entre janelas usando sempre os mesmos atalhos, estando no modo
-- normal, inserção ou terminal. <C-k> para ir para a janela de cima, <C-j>
-- para a de baixo, <C-h> para a da direita e <C-l> para a da esquerda
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("i", "<c-k>", "<esc><c-w>k")
vim.keymap.set("i", "<c-j>", "<esc><c-w>j")
vim.keymap.set("i", "<c-h>", "<esc><c-w>h")
vim.keymap.set("i", "<c-l>", "<esc><c-w>l")
vim.keymap.set("t", "<c-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<c-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<c-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<c-l>", "<c-\\><c-n><c-w>l")
vim.keymap.set("t", "<c-q>", "<c-\\><c-n><c-w>q")

-- Restaura alguns atalhos de teclado do terminal
vim.keymap.set("t", "<a-l>", "<c-l>")
vim.keymap.set("t", "<a-k>", "<c-k>")

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

-- Apagando espaço em branco sobressalente
local function trim()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.api.nvim_win_set_cursor(0, pos)
end
vim.keymap.set("n", "<leader><bs>", trim)

-- Atalhos para abrir e manipular um terminal único
local term = require("eduardo.core.terminal")
vim.keymap.set("n", "<leader>t", term.open)
vim.keymap.set("n", "<leader>e", term.edit)
vim.keymap.set("n", "<leader>r", term.rec)
