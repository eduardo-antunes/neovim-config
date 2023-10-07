-- Esse arquivo é o ponto de partida da config. Ele se destina a
-- configurações gerais e a carregar os demais módulos da config.

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.termguicolors = true
vim.cmd.colors "habamax"
vim.cmd.hi "Normal guibg=NONE"
vim.cmd.hi "Visual guifg=NONE guibg=#3A3A3A"

require("eduardo.config") -- configuração de opções
require("eduardo.remap")  -- atalhos de teclado
require("eduardo.pack")   -- carrega plugins
