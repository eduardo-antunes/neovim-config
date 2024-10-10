-- autocmd.lua: comandos automáticos são um aspecto importante do neovim. Eles
-- permitem associar listas de comandos de vim (ou funções de lua) a ocorrência
-- de certos eventos no editor, para que executem sem interação com o usuário

local e = vim.api.nvim_create_augroup("eduardo", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

-- Configurações visuais do terminal -------------------------------------------

autocmd("TermOpen",  { group = e, command = "setl nonu nornu scrolloff=0" })
autocmd("TermEnter", { group = e, command = "NoMatchParen" })
autocmd("TermLeave", { group = e, command = "DoMatchParen" })

-- Configurações de linguagens -------------------------------------------------

local lsp = require("eduardo.core.lsp")
local l = vim.api.nvim_create_augroup("eduardo-lsp", {})
autocmd("LspAttach", { group = l, callback = lsp.conf })

autocmd("FileType", {
  group = l, pattern = { "c", "cpp" }, callback = function()
    lsp.attach("clangd", { ".clangd", "compile_commands.json" })
  end
})

autocmd("FileType", {
  group = l, pattern = "python", callback = function()
    lsp.attach("pyright-langserver", {}, { "--stdio" })
  end
})

autocmd("FileType", {
  group = l, pattern = { "go", "gomod" }, callback = function()
    lsp.attach("gopls", { "go.mod" })
  end
})

autocmd("FileType", {
  group = l, pattern = "rust", callback = function()
    lsp.attach("rust-analyzer", { "Cargo.toml" })
  end
})
