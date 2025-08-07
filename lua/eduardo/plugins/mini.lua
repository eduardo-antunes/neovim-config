-- plugins/mini.lua: configura os plugins da biblioteca mini.nvim

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.move").setup()
require("mini.align").setup()
require("mini.completion").setup()
require("mini.misc").setup_termbg_sync()

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
    border = "rounded",
  }
end

local pick = require("mini.pick")
pick.setup {
  window = { config = win_config },
  source = { show = pick.default_show },
}
vim.ui.select = pick.ui_select
