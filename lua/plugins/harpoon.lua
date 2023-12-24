-- Marcas de navegação mais eficientes com o harpoon.nvim

return {
  "theprimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  init = function ()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")
    local exec = require("harpoon.tmux")

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

    -- Execução assíncrona de comandos com o tmux
    local exec_prompt = function ()
      exec.sendCommand(1, vim.fn.input("$ "))
    end
    vim.keymap.set("n", "<leader>!", exec_prompt)
  end,
}
