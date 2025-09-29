-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local function gh(name)
  return string.format("https://github.com/%s", name)
end

vim.pack.add {
  { src = gh "catppuccin/nvim", name = "catppuccin" },
  { src = gh "eduardo-antunes/plainline"            },
  { src = gh "NMAC427/guess-indent.nvim"            },
  { src = gh "nvim-treesitter/nvim-treesitter"      },
  { src = gh "nvim-mini/mini.nvim"                  },
  { src = gh "stevearc/oil.nvim"                    },
}

require("catppuccin").setup {
  show_end_of_buffer = true,
  term_colors = true,
}
vim.cmd.colors "catppuccin"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")
