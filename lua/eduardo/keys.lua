-- Atalhos de teclado em geral

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local ed = require('eduardo.utils')

ed.leader_keys {
  ['s']  = ':%s/',
  ['w']  = '<C-w>',
  ['e']  = ':e %:h/',
  ['d']  = vim.cmd.Explore,
  ['bd'] = vim.cmd.bdelete,

  -- lista de quickfix local:
  ['q']  = vim.cmd.lopen,
  ['j']  = vim.cmd.lnext,
  ['k']  = vim.cmd.lprev,
}

local keys = vim.keymap.set

-- lista de quickfix global:
keys('n', '<c-q>', vim.cmd.copen)
keys('n', '<c-j>', vim.cmd.cnext)
keys('n', '<c-k>', vim.cmd.cprev)

-- movendo linhas no modo visual:
keys('v', 'J', ':m\'>+1<cr>gv=gv')
keys('v', 'K', ':m\'>-2<cr>gv=gv')
