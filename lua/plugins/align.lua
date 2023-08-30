-- Atalhos para alinhar texto verticalmente com rapidez

return {
  "vonr/align.nvim",
  init = function ()

    local lib = require("align")
    local opts = { silent = true, remap = false }
    vim.keymap.set("x", "aa", function() lib.align_to_char(1, true) end, opts)
    vim.keymap.set("x", "aw", function() lib.align_to_string(false, true, true) end, opts)

  end
}
