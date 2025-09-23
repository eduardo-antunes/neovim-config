-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

local function gh(name)
  return string.format("https://github.com/%s", name)
end

vim.pack.add {
  { src = gh "wtfox/jellybeans.nvim"           },
  { src = gh "eduardo-antunes/plainline"       },
  { src = gh "NMAC427/guess-indent.nvim"       },
  { src = gh "nvim-treesitter/nvim-treesitter" },
  { src = gh "nvim-mini/mini.nvim"             },
  { src = gh "stevearc/oil.nvim"               },
}

require("jellybeans").setup {
  bold = false,
  on_highlights = function(highlights, colors)
    local none = { fg = colors.foreground }
    local none_bg = { bg = colors.background }
    highlights["@variable.builtin"] = none
    highlights["MiniPickNormal"] = none_bg
  end
}
vim.cmd.colors "jellybeans"

require("plainline").setup()
require("guess-indent").setup()

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
require("eduardo.plugins.oil")
