-- keys.lua: configurações de atalhos de teclado não relacionados a plugins.
-- Inclui alguns recursos de qualidade de vida que tornam tudo mais agradável

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local u = require("eduardo.lib.utils")
local term = require("eduardo.lib.terminal")

-- Básicos ---------------------------------------------------------------------

vim.keymap.set("n", "H"      , "^"      )
vim.keymap.set("n", "L"      , "$"      )
vim.keymap.set("n", "Q"      , "<nop>"  )
vim.keymap.set("n", "<tab>"  , "gt"     )
vim.keymap.set("n", "<s-tab>", "gT"     )
vim.keymap.set("n", "<bs>"   , "<c-^>zz")
vim.keymap.set("n", "<c-u>"  , "<c-u>zz")
vim.keymap.set("n", "<c-d>"  , "<c-d>zz")

vim.keymap.set("n", "<leader><bs>", u.trim_ws, { desc = "Remove espaços em branco sobressalentes" })
vim.keymap.set("n", "<leader>*"   , u.padline, { desc = "Completa linha até 80 colunas" })

vim.keymap.set("n", "<leader>w", vim.cmd.write             , { desc = "Salva arquivo"                       })
vim.keymap.set("n", "<leader>s", ":%s/<c-r><c-w>/"         , { desc = "Substitui palavra globalmente"       })
vim.keymap.set("n", "<leader>e", ":e %:h/"                 , { desc = "Edita arquivo no diretório do atual" })
vim.keymap.set("n", "<leader>/", ":grep "                  , { desc = "Grep"                                })
vim.keymap.set("n", "<leader>n", ":tabnew|tcd ~/src/"      , { desc = "Nova aba"                            })
vim.keymap.set("n", "<leader>T", "<cmd>tabnew|terminal<cr>", { desc = "Nova aba (terminal)"                 })

-- Cópia e cola ----------------------------------------------------------------

vim.keymap.set("n", "<leader>p" , '"+p' , { desc = "Cola do clipboard do sistema"            })
vim.keymap.set("v", "<leader>p" , '"_dP', { desc = "Susbtitui seleção por reg. 0"            })
vim.keymap.set("n", "<leader>y" , '"+y' , { desc = "Copia para reg. +"                       })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copia linha para reg. +"                 })
vim.keymap.set("n", "<leader>Y" , '"+y$', { desc = "Copia resto da linha para o clipboard +" })
vim.keymap.set("v", "<leader>y" , '"+y' , { desc = "Copia seleção para reg. +"               })
vim.keymap.set("v", "<leader>x" , '"_d' , { desc = "Apaga seleção para /dev/null"            })

-- Terminal --------------------------------------------------------------------

vim.keymap.set("t", "<esc>", term.esc)
vim.keymap.set("t", "<a-l>", "<c-l>")
vim.keymap.set("t", "<a-k>", "<c-k>")
vim.keymap.set("n", "<leader>t", term.open, { desc = "Terminal" })
vim.keymap.set("n", "<leader>r", function() term.send "!!" end, { desc = "Repete comando" })

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
