-- plugins/init.lua: instala e configura os plugins que eu uso

local function gh(name)
  return string.format("https://github.com/%s", name)
end

vim.pack.add {
  { src = gh "catppuccin/nvim", name = "catppuccin" },
  { src = gh "eduardo-antunes/plainline"            },
  { src = gh "NMAC427/guess-indent.nvim"            },
  { src = gh "nvim-treesitter/nvim-treesitter"      },
  { src = gh "echasnovski/mini.nvim"                },
  { src = gh "stevearc/oil.nvim"                    },
}

require("catppuccin").setup {
  no_bold = true,
  show_end_of_buffer = true,
  styles = { conditionals = {} },
  custom_highlights = function(colors)
    local none = { fg = colors.text }
    return {
      Constant = none,
      ["@constant.macro"]   = none,
      ["@constant.builtin"] = none,
      ["@function.builtin"] = none,
      ["@variable.builtin"] = none,
    }
  end
}
vim.cmd.colors "catppuccin"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")

