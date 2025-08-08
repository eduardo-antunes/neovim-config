-- lsp.lua: configura o LSP para as linguagens e servidores que eu uso

local function toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("eduardo-lsp", {}),
  callback = function(args)
    vim.lsp.document_color.enable(false, args.buf)
    vim.lsp.semantic_tokens.enable(false)
    vim.keymap.set("n", "grh", toggle_hints)
  end
})

vim.lsp.config("clangd", {
  cmd = { "clangd" }, filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json", ".git" },
})

vim.lsp.config("pylsp", {
  cmd = { "pylsp" }, filetypes = { "python" },
  root_markers = { "setup.py", "requirements.txt", ".git" },
})

vim.lsp.config("gopls", {
  cmd = { "gopls" }, filetypes = { "go", "gomod" },
  root_markers = { "go.mod", ".git" },
})

vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" }, filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
})

if not vim.g.lsp_disable then
  vim.lsp.enable { "clangd", "pylsp", "gopls", "rust-analyzer" }
end
