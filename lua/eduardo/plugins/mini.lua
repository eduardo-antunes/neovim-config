-- plugins/mini.lua: configura os vários pequenos plugins compreendidos
-- pela biblioteca mini.nvim. É uma coleção extremamente útil

-- Equilibra delimitadores automaticamente, o que para mim é realmente
-- uma necessidade básica. Similar ao electric-pair do emacs
require("mini.pairs").setup()

-- Oferece operações extras sobre delimitadores. É portanto similar ao
-- vim-surround do tpope, embora não seja "retrocompatível" com ele (os
-- atalhos são diferentes, mas são também lógicos)
require("mini.surround").setup()

-- Atalhos para movimentar seleções arbitrárias de texto por um arquivo;
-- substitui alguns dos meus atalhos mais úteis e confusos
require("mini.move").setup()

-- Atalhos e funções para alinhar texto verticalmente. Eu adoro fazer
-- isso, e me deixa bem satisfeito que não dê mais trabalho
require("mini.align").setup()

-- Expande o sistema de preenchimento ("completion") nativo do vim,
-- tornando-o automático e integrando com LSP. Muito leve e simples
-- quando comparado a alternativas como o nvim-cmp, e já me atende bem
require("mini.completion").setup()

-- Caso o tema do terminal e o do neovim não sejam iguais, normalmente
-- aparecem bordas com o tema do terminal em torno do editor, o que não é
-- muito agradável. Essa função evita isso
require("mini.misc").setup_termbg_sync()

-- Funcionalidade extra para outros plugins do mini.nvim
require("mini.extra").setup()

--------------------------------------------------------------------------------

-- Seletor genérico, leve e flexível. Alternativa mínima ao telescope
local pick = require("mini.pick")

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  local row = math.floor(0.5 * (vim.o.lines - height))
  local col = math.floor(0.5 * (vim.o.columns - width))
  return {
    row = row, col = col,
    width = width, height = height,
    anchor = "NW",
    style  = "minimal",
    border = "rounded",
  }
end

pick.setup {
  source = { show = pick.default_show },
  window = { config = win_config }
}
vim.ui.select = pick.ui_select

local u = require("eduardo.utils")

vim.keymap.set("n", "<c-f>", pick.builtin.files)
vim.keymap.set("n", "<c-b>", pick.builtin.buffers)
vim.keymap.set("n", "<leader>h", pick.builtin.help)

-- Pesquisa apenas arquivos com a mesma extensão que o arquivo atual.
-- Remove o maior prefixo comum de todos os caminhos. Muito útil em java
vim.keymap.set("n", "<leader>f", function()
  local ext = vim.fn.expand("%:e")
  pick.builtin.cli {
    command = { "rg", "-g", "*." .. ext, "--files" },
    postprocess = function(lines)
      local items = {}
      local prefix_len = u.commonprefix_len(lines)
      for _, line in ipairs(lines) do
        table.insert(items, line:sub(prefix_len + 1))
      end
      return items
    end,
  }
end)

-- Pesquisa apenas arquivos no diretório atual
vim.keymap.set("n", "<leader>.", function()
  local dir = vim.fn.expand("%:h")
  pick.builtin.cli {
    command = { "rg", "--files", dir },
    postprocess = function(lines)
      local items = {}
      for _, line in ipairs(lines) do
        table.insert(items, vim.fn.fnamemodify(line, ":t"))
      end
      return items
    end
  }
end)
