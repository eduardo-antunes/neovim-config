-- Tecla líder e líder local

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Uma recomendação que me deram

vim.keymap.set('n', 'Q', '<nop>')

-- Pequenas conveniências

vim.keymap.set('n', '<leader>s', ':%s/')
vim.keymap.set('n', '<leader>w', '<c-w>')
vim.keymap.set('n', '<leader>e', ':e %:h/')
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete)

-- Copiar para e colar do clipboard do sistema

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')

-- Apagar texto para o registrador nulo

vim.keymap.set('n', '<leader>D', '"_D')
vim.keymap.set('n', '<leader>dd', '"_dd')
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')

-- Movimentação um pouco mais agradável

vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

-- Movendo linhas no modo visual

vim.keymap.set('v', 'J', ':m\'>+1<cr>gv=gv')
vim.keymap.set('v', 'K', ':m\'>-2<cr>gv=gv')

-- Lista de quickfix local

vim.keymap.set('n', '<leader>q', vim.cmd.lopen)
vim.keymap.set('n', '<leader>j', vim.cmd.lnext)
vim.keymap.set('n', '<leader>k', vim.cmd.lprev)

-- Lista de quickfix global

vim.keymap.set('n', '<c-q>', vim.cmd.copen)
vim.keymap.set('n', '<c-j>', vim.cmd.cnext)
vim.keymap.set('n', '<c-k>', vim.cmd.cprev)

-- Atalhos do Git (via vim-fugitive)

vim.keymap.set('n', '<leader>g', ':Git ')
vim.keymap.set('n', '<leader>G', vim.cmd.Git)
