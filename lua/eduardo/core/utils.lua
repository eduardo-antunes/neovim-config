-- utils.lua: pequenas funções utilitárias, usadas principalmente como atalhos
-- de teclado definidos em keys.lua. Boa parte foram inspiradas em entradas no
-- vim wiki ou no stack overflow

local this = {}

-- Apaga espaços em branco sobressalentes em um arquivo
function this.trim()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd [[ keeppatterns %s/\s\+$//e ]]
  vim.api.nvim_win_set_cursor(0, pos)
end

-- Insere um certo caracter no fim da linha atual para que esta passe a ter um
-- certo número fixo de colunas. Bom para criar divisórias em códigos
function this.padline(x, n)
  n = (n or 80) - vim.fn.virtcol "$"
  local cmd = string.format("normal $%da%s", n, x or "-")
  vim.cmd.normal "$a "
  vim.cmd(cmd)
end

return this
