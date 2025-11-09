-- utils.lua: pequenas funções utilitárias. Esse é um arquivo que vive sumindo
-- e reaparecendo na minha configuração, mas agora tem uma lógica
-- substancialmente grande para permanecer (eu acho)

local M = {}

-- Calcula o tamanho do maior prefixo comum em uma lista de strings, ignorando
-- quaisquer strings vazias na entrada. O algoritmo é baseado no código da
-- função os.path.commonprefix do python
function M.common_prefix_len(words)
  if not words or #words == 0 then
    return 0
  end

  local min = words[1]
  local max = words[1]
  for i = 2, #words do
    if #words[i] ~= 0 then
      if words[i] < min then min = words[i] end
      if words[i] > max then max = words[i] end
    end
  end

  local c = 0
  for i = 1, #min do
    if max:byte(i) ~= min:byte(i) then
      break
    end
    c = c + 1
  end
  return c
end

-- Apaga espaços em branco sobressalentes em um arquivo
function M.trim_ws()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd [[ keeppatterns %s/\s\+$//e ]]
  vim.api.nvim_win_set_cursor(0, pos)
end

-- Preenche linha com '-' até que ela tenha 80 colunas
function M.padline()
  n = 80 - vim.fn.virtcol "$" + 1
  vim.cmd(string.format("normal $%da-", n))
end

-- Calcula os valores necessários para centralizar janelas flutuantes
function M.win_center_compute()
  local W, H = vim.o.columns, vim.o.lines
  local height = math.floor(0.618 * H)
  local width  = math.floor(0.618 * W)
  return {
    anchor = "NW",
    height = height, width = width,
    row = math.floor(0.5 * (H - height)),
    col = math.floor(0.5 * (W - width)),
  }
end

return M
