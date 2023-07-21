-- Configurações para o plugin harpoon.nvim

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local term = require("harpoon.term")

-- Operações sobre a lista de marcas
vim.keymap.set("n", "<leader>hr", mark.rm_file)
vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

-- Operações de navegação entre marcas
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)

-- Operações sobre terminais (uso pouco, mas é bom ter)
vim.keymap.set("n", "<leader><cr>", function() term.gotoTerminal(1) end)
