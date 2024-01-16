-- Configuração das cores. Eu utilizo o tema nativo vim-habamax, com algumas
-- pequenas modificações pontuais que o tornam ainda mais bacana. Aqui é
-- criada uma função global load_habamax que, além de carregar o tema,
-- também faz as modificações apropriadas. Muito conveniente

local function tweak_hl(groups)
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group[1], { bg = group.bg, fg = group.fg })
  end
end

function load_habamax()
  vim.opt.termguicolors = true
  vim.cmd.colors "habamax"
  tweak_hl {
    { "Visual",   bg = "#3A3A3A", fg = "NONE"  },
    { "PmenuSel", bg = "#87AFAF", fg = "black" },
    { "FloatBorder", bg = "NONE" },
  }
  vim.cmd.highlight("Comment gui=italic")
end

-- Teste drive do novo tema padrão
vim.opt.termguicolors = true
