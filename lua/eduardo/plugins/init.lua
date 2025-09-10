-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local function gh(name)
  return string.format("https://github.com/%s", name)
end

vim.pack.add {
  { src = gh "sainnhe/sonokai"                 },
  { src = gh "eduardo-antunes/plainline"       },
  { src = gh "NMAC427/guess-indent.nvim"       },
  { src = gh "nvim-treesitter/nvim-treesitter" },
  { src = gh "nvim-mini/mini.nvim"             },
  { src = gh "stevearc/oil.nvim"               },
}

vim.g.sonokai_style = "shusia"
vim.g.sonokai_better_performance = true
vim.cmd.colors "sonokai"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")
