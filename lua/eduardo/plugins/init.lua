-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local github = function(x) return "https://github.com/" .. x end

vim.pack.add {
  { src = github "eduardo-antunes/accent.nvim"     },
  { src = github "eduardo-antunes/plainline"       },
  { src = github "NMAC427/guess-indent.nvim"       },
  { src = github "mason-org/mason.nvim"            },
  { src = github "nvim-treesitter/nvim-treesitter" },
  { src = github "mfussenegger/nvim-jdtls"         },
  { src = github "nvim-mini/mini.nvim"             },
  { src = github "stevearc/oil.nvim"               },
}

vim.g.accent_colour = "green"
vim.g.accent_invert_status = true
vim.cmd.colors "accent"

require("plainline").setup()
require("guess-indent").setup()
require("mason").setup {
  ui = {
    icons = {
      package_installed   = "*",
      package_pending     = "*",
      package_uninstalled = "*",
    }
  }
}

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.pick")
require("eduardo.plugins.oil")
