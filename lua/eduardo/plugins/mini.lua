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

-- Configura a janela do mini.pick para que fique centralizada e tenha
-- bordas arredondadas
local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
    border = "rounded",
  }
end

pick.setup {
  window = { config = win_config },
  source = { show = pick.default_show }, -- sem ícones
}
-- Torna o mini.pick a interface padrão de seleção
vim.ui.select = pick.ui_select

vim.keymap.set("n", "<c-f>", pick.builtin.files)
vim.keymap.set("n", "<c-b>", pick.builtin.buffers)
vim.keymap.set("n", "<leader>h", pick.builtin.help)

-- Seleciona entre todas as ocorrências de um texto no diretório atual,
-- usando o programa ripgrep para efetuar a pesquisa
vim.keymap.set("n", "<leader>/", function ()
  local w = vim.fn.input("Pesquisar no diretório: ")
  if w == "" then return end -- operação cancelada
  pick.builtin.grep { pattern = w }
end)
