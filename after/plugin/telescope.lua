-- Configurações para telescope.nvim

local ed = require('eduardo.utils')
local tel = require('telescope.builtin')

local function tel_grep()
  tel.grep_string { search = vim.fn.input('Grep: ') }
end

ed.leader_keys {
  [' '] = tel.buffers,
  ['.'] = tel.find_files,
  [':'] = tel.commands,
  ['/'] = tel_grep,
}
