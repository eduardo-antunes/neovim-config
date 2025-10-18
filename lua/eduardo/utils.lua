-- utils.lua: pequenas funções utilitárias. Esse é um arquivo que vive sumindo
-- e reaparecendo na minha configuração, mas agora tem uma lógica
-- substancialmente grande para permanecer (eu acho)

local M = {}

-- Calcula o tamanho do maior prefixo comum em uma lista de strings, ignorando
-- quaisquer strings vazias na entrada. O algoritmo é baseado no código da
-- função os.path.commonprefix do python
function M.commonprefix_len(words)
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

return M
