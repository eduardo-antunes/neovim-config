-- plugins/init.lua: instala e configura os plugins que eu uso com vim.pack

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
      ["@constant.macro"]     = none,
      ["@constant.builtin"]   = none,
      ["@function.builtin"]   = none,
      ["@variable.builtin"]   = none,
      ["@variable.parameter"] = none,
      ["@function.call"]      = none,
    }
  end
}
vim.cmd.colors "catppuccin"

require("plainline").setup()
require("guess-indent").setup()

require("oil").setup {
  columns = {},
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    ["<CR>"] = false,
    ["<C-s>"] = false,
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-e>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-q>"] = "actions.close",
    ["gr"]    = { "actions.refresh", mode = "n" }
  },
  view_options = {
    -- Mesmo ao exibir arquivos ocultos, não faz sentido exibir o
    -- pseudo-diretório '..', pois ele não agrega nada, realmente
    is_always_hidden = function(nome, id) return nome == ".." end
  },
}
vim.keymap.set("n", "-", vim.cmd.Oil)
vim.keymap.set("n", "<leader>-", "<cmd>vs|Oil<cr>")

require("eduardo.plugins.treesitter")
require("eduardo.plugins.mini")
