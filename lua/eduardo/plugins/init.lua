-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local function gh(name)
  return string.format("https://github.com/%s", name)
end

vim.pack.add {
  { src = gh "bluz71/vim-nightfly-colors"      },
  { src = gh "eduardo-antunes/plainline"       },
  { src = gh "NMAC427/guess-indent.nvim"       },
  { src = gh "nvim-treesitter/nvim-treesitter" },
  { src = gh "nvim-mini/mini.nvim"             },
  { src = gh "stevearc/oil.nvim"               },
}

vim.g.nightflyNormalFloat = true
vim.cmd.colors "nightfly"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")
