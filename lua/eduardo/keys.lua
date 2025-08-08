-- keys.lua: configuração de atalhos não relacionados a plugins

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local u = require("eduardo.lib.utils")
local term = require("eduardo.lib.terminal")

local function bind(lhs, rhs)
  vim.keymap.set("n", lhs, rhs)
end

local function leader(lhs, rhs, mode)
  mode = mode or "n"
  vim.keymap.set(mode, "<leader>" .. lhs, rhs)
end

bind("H"       , "^"           )
bind("L"       , "$"           )
bind("Q"       , "<nop>"       )
bind("<tab>"   , "gt"          )
bind("<s-tab>" , "gT"          )
bind("<bs>"    , "<c-^>zz"     )
bind("<c-u>"   , "<c-u>zz"     )
bind("<c-d>"   , "<c-d>zz"     )
bind("<c-q>"   , vim.cmd.copen )
bind("<c-n>"   , vim.cmd.cnext )
bind("<c-p>"   , vim.cmd.cprev )

leader("<bs>" , u.trim                        )
leader("*"    , u.padline                     )
leader("w"    , vim.cmd.write                 )
leader("t"    , term.open                     )
leader("r"    , function() term.send "!!" end )
leader("T"    , "<cmd>tabnew|terminal<cr>"    )
leader("s"    , ":%s/"                        )
leader("e"    , ":e %:h/"                     )
leader("n"    , ":tabnew|tcd ~/Projetos/"     )
leader("q"    , vim.cmd.lopen)
leader("j"    , vim.cmd.lnext)
leader("k"    , vim.cmd.lprev)

-- Atalhos para copiar e colar do clipboard do sistema, e para apagar sem copiar
leader("p" , '"+p' )
leader("y" , '"+y' )
leader("yy", '"+yy')
leader("Y" , '"+y$')
leader("d" , '"_d' )
leader("dd", '"_dd')
leader("D" , '"_D' )
leader("y" , '"+y'  , "v" )
leader("p" , '"_dP' , "v" )
leader("d" , '"_d'  , "v" )

-- Conveniências para o uso de atalhos no terminal
vim.keymap.set("t", "<esc>", term.esc)
vim.keymap.set("t", "<a-l>", "<c-l>")
vim.keymap.set("t", "<a-k>", "<c-k>")

-- Navegação entre janelas com CTRL + {h,j,k,l} nos modos normal, inserção e terminal
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
