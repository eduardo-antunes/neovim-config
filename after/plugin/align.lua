-- Configurações para align.nvim

local function quick_align()
  require('align').align_to_char(1, true)
end

local function precise_align()
  require('align').align_to_string(false, true, true)
end

vim.keymap.set('x', 'aa', quick_align,   { silent = true })
vim.keymap.set('x', 'aw', precise_align, { silent = true })
