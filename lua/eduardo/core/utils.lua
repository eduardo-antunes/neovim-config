-- utils.lua: pequenas funções utilitárias, usadas principalmente como lado
-- direito para atalhos de teclado

local this = {}

-- Apaga espaços em branco sobressalentes em um arquivo
function this.trim()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd [[ keeppatterns %s/\s\+$//e ]]
  vim.api.nvim_win_set_cursor(0, pos)
end

-- Insere quantas cópias do caractere x (padrão: '-') forem necessários para que
-- a linha ocupe n (padrão: 80) colunas
function this.padline(x, n)
  n = (n or 80) - vim.fn.virtcol "$" + 1
  local cmd = string.format("normal $%da%s", n, x or "-")
  vim.cmd(cmd)
end

return this
