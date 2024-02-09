-- Explorador/editor de arquivos similar ao dired do emacs. É útil inclusive
-- fora da utilização normal do neovim, como uma ferramenta de renomeação
-- coletiva de arquivos no terminal (nunca entendi como o rename funciona)

local function toggle_permissions()
  -- Função muito simples que basicamente só me atende
  if #require("oil.config").columns > 1 then
    require("oil").set_columns { "size" }
    return
  end
  require("oil").set_columns { "size", "permissions" }
end

return {
  "stevearc/oil.nvim",
  opts = {
    columns = { "size" },
    delete_to_trash = true,
    win_options = {
      conceallevel = 3,
      concealcursor = "nvic",
      relativenumber = false,
    },
    keymaps = {
      ["e"] = "actions.select",
      ["H"] = "actions.select_vsplit",
      ["K"] = "actions.select_split",
      ["gr"] = "actions.refresh",
      ["gp"] = toggle_permissions,
      ["<BS>"] = "actions.parent",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-t>"] = false,
    },
  },
  init = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil)
  end
}
