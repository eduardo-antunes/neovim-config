-- keys.lua: configuração de atalhos não relacionados a plugins

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local function bind(lhs, rhs)
  vim.keymap.set("n", lhs, rhs)
end

local function leader(lhs, rhs, mode)
  mode = mode or "n"
  vim.keymap.set(mode, "<leader>" .. lhs, rhs)
end

-- Apaga espaços em branco sobressalentes em um arquivo
local function trim_ws()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd [[ keeppatterns %s/\s\+$//e ]]
  vim.api.nvim_win_set_cursor(0, pos)
end

-- Preenche linha com '-' até que ela tenha 80 colunas
local function padline()
  n = 80 - vim.fn.virtcol "$" + 1
  vim.cmd(string.format("normal $%da-", n))
end

bind("H"       , "^"           )
bind("L"       , "$"           )
bind("Q"       , "<nop>"       )
bind("<tab>"   , "gt"          )
bind("<s-tab>" , "gT"          )
bind("<bs>"    , "<c-^>zz"     )
bind("<c-u>"   , "<c-u>zz"     )
bind("<c-d>"   , "<c-d>zz"     )

leader("<bs>" , trim_ws                   )
leader("*"    , padline                   )
leader("w"    , vim.cmd.write             )
leader("T"    , "<cmd>tabnew|terminal<cr>")
leader("s"    , ":%s/"                    )
leader("e"    , ":e %:h/"                 )
leader("n"    , ":tabnew|tcd ~/src/"      )

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

-- Navegação entre janelas com CTRL + {h,j,k,l} nos modos normal e inserção
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("i", "<c-k>", "<esc><c-w>k")
vim.keymap.set("i", "<c-j>", "<esc><c-w>j")
vim.keymap.set("i", "<c-h>", "<esc><c-w>h")
vim.keymap.set("i", "<c-l>", "<esc><c-w>l")
