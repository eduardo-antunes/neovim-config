-- autocmd.lua: comandos automáticos são um aspecto importante do neovim. Eles
-- permitem associar listas de comandos de vim (ou funções de lua) a ocorrência
-- de certos eventos no editor, para que executem sem interação com o usuário

local e = vim.api.nvim_create_augroup("eduardo", {})
local autocmd = vim.api.nvim_create_autocmd

-- Destaca o texto copiado após operações de cópia
autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

-- Configurações de buffers de terminal
autocmd("TermOpen", { group = e, command = "setl nonu nornu scrolloff=0" })

-- Desativa hightlighting de delimitadores correspondentes no modo terminal,
-- pelo simples motivo de que isso tira a minha concentração
autocmd("TermEnter", { group = e, command = "NoMatchParen" })
autocmd("TermLeave", { group = e, command = "DoMatchParen" })

-- Comandos automáticos relacionados ao LSP têm seu próprio grupo e usam a
-- minha "biblioteca" de configuração de lsp

local lsp = require("eduardo.core.lsp")
local l = vim.api.nvim_create_augroup("eduardo-lsp", {})
autocmd("LspAttach", { group = l, callback = lsp.conf })

-- Configuração para C/C++
autocmd("FileType", {
  group = l, pattern = { "c", "cpp" }, callback = function()
    lsp.attach("clangd", { ".clangd", "compile_commands.json" })
  end
})

-- Configuração para python
autocmd("FileType", {
  group = l, pattern = "python", callback = function()
    lsp.attach("pyright-langserver", {}, { "--stdio" })
  end
})

-- Configuração para Go
autocmd("FileType", {
  group = l, pattern = { "go", "gomod" }, callback = function()
    lsp.attach("gopls", { "go.mod" })
  end
})

-- Configuração para Rust
autocmd("FileType", {
  group = l, pattern = "rust", callback = function()
    lsp.attach("rust-analyzer", { "Cargo.toml" })
  end
})
