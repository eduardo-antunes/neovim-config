-- Explorador/editor de arquivos similar ao dired do emacs. É útil inclusive
-- fora da utilização normal do neovim, como uma ferramenta de renomeação
-- coletiva de arquivos no terminal (nunca entendi como o rename funciona)

return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      { "size",        highlight = "Number" },
      { "permissions", highlight = "String" },
    },
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
      ["gt"] = "actions.open_terminal",
      ["<BS>"] = "actions.parent",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-t>"] = false,
    },
    view_options = {
      is_always_hidden = function(name, bufnr)
        return name == ".."
      end
    },
  },
  init = function ()
    vim.keymap.set("n", "-", vim.cmd.Oil)
  end
}
