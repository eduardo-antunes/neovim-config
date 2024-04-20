-- autocmd.lua: comandos automáticos são um aspecto importante do neovim. Eles
-- permitem associar listas de comandos de vim (ou funções de lua) a ocorrência
-- de certos eventos no editor, para que executem sem interação com o usuário

local a = vim.api
local eduardo = a.nvim_create_augroup("eduardo", {})

-- Remove espaços em branco sobressalentes ao salvar
a.nvim_create_autocmd("BufWritePre", {
  group = eduardo, command = ":%s/\\s\\+$//e"
})

-- Destaca o texto copiado após operações de cópia
a.nvim_create_autocmd("TextYankPost", {
  group = eduardo, callback = function() vim.highlight.on_yank() end
})

-- Sem números de linha em buffers de terminal (não tem sentido)
a.nvim_create_autocmd("TermOpen", {
  group = eduardo, command = "setl nonu nornu"
})

-- Desativa hightlighting de delimitadores correspondentes no modo terminal,
-- pelo simples motivo de que isso tira a minha concentração
a.nvim_create_autocmd("TermEnter", { group = eduardo, command = "NoMatchParen" })
a.nvim_create_autocmd("TermLeave", { group = eduardo, command = "DoMatchParen" })
