-- Configuração das cores. Eu utilizo o tema nativo vim-habamax com algumas
-- pequenas modificações pontuais.

function load_habamax()
  vim.opt.termguicolors = true
  vim.cmd.colors "habamax"
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#3A3A3A", fg = "NONE" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#87AFAF", fg = "black" })
end

load_habamax() -- habamax por padrão
