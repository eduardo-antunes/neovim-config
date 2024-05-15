-- autocmd.lua: comandos automáticos são um aspecto importante do neovim. Eles
-- permitem associar listas de comandos de vim (ou funções de lua) a ocorrência
-- de certos eventos no editor, para que executem sem interação com o usuário

local a = vim.api
local eduardo = a.nvim_create_augroup("eduardo", {})

-- Destaca o texto copiado após operações de cópia
a.nvim_create_autocmd("TextYankPost", {
  group = eduardo, callback = function() vim.highlight.on_yank() end
})

-- Configurações de buffers de terminal
a.nvim_create_autocmd("TermOpen", {
  group = eduardo, command = "setl nonu nornu scrolloff=0"
})

-- Desativa hightlighting de delimitadores correspondentes no modo terminal,
-- pelo simples motivo de que isso tira a minha concentração
a.nvim_create_autocmd("TermEnter", { group = eduardo, command = "NoMatchParen" })
a.nvim_create_autocmd("TermLeave", { group = eduardo, command = "DoMatchParen" })

-- Deixa a opção 'list' ligada apenas no modo normal
a.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n", group = eduardo, command = "set list"
})
a.nvim_create_autocmd("ModeChanged", {
  pattern = "n:*", group = eduardo, command = "set nolist"
})
