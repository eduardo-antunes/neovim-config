-- highlights.lua: configurações de destaque customizadas que tornam a
-- experiência do tema padrão do neovim mais agradável. Caso a variável global
-- transparent_background esteja ativa, deixa o fundo transparente

local function link(arg)  vim.cmd.hi("link " .. arg)  end
local function clear(arg) vim.cmd.hi("clear " .. arg) end

function set_highlights()
  if vim.g.colors_name ~= nil and vim.g.colors_name ~= "default" then
    return -- não é o tema padrão; melhor não mexer
  end

  if vim.o.laststatus == 3 then
    -- Com uma statusline global, a cor da statusline inativa simplesmente
    -- faz mais sentido para uso cotidiano. É bem mais agradável
    clear "StatusLine"
    link "StatusLine StatusLineNC"
  end
  link "@variable.builtin @variable"
  link "@constant.builtin Identifier"
  link "@type.builtin Identifier"
  link "@attribute Identifier"

  link "@property.lua @variable"
  link "@variable.member.rust Identifier"
  link "@constant.rust Identifier"
  link "@variable.builtin.java @variable"

  -- Fundo transparente
  if vim.g.transparent_background then
    local hls = {
      "Normal"     ,
      "NormalNC"   ,
      "LineNr"     ,
      "Folded"     ,
      "NonText"    ,
      "SpecialKey" ,
      "VertSplit"  ,
      "SignColumn" ,
    }
    for _, hl in ipairs(hls) do
      vim.cmd.hi(hl .. " guibg=NONE ctermbg=NONE")
    end
  end
end

-- Caso eu mude para outro tema para testar e queira voltar para o padrão com
-- os meus highlights customizados, basta usar o comando 'lua set_highlights()'
set_highlights()
