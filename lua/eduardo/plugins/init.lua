-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local function gh(name)
  return string.format("https://github.com/%s", name)
end

local function src_hut(name)
  return string.format("https://git.sr.ht/~%s", name)
end

vim.pack.add {
  src_hut "poof/alabaster.nvim"        ,
  gh "eduardo-antunes/plainline"       ,
  gh "NMAC427/guess-indent.nvim"       ,
  gh "nvim-treesitter/nvim-treesitter" ,
  gh "echasnovski/mini.nvim"           ,
  gh "stevearc/oil.nvim"               ,
}

vim.g.alabaster_floatborder = true
vim.cmd.colors "alabaster"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")
