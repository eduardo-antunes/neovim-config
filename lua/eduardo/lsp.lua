-- lsp.lua: configura o LSP para as linguagens e servidores que eu uso

local function toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function doc_symbols()
  require("mini.extra").pickers.lsp { scope = "document_symbol" }
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("eduardo-lsp", {}),
  callback = function(args)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition)
    vim.keymap.set("n", "grh", toggle_hints)
    vim.keymap.set("n", "gO", doc_symbols)
    vim.lsp.document_color.enable(false, args.buf)
    vim.lsp.semantic_tokens.enable(false)
  end
})

vim.lsp.config("*", { root_markers = { ".git" }})

--------------------------------------------------------------------------------

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json" },
})

vim.lsp.config("pylsp", {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "setup.py", "requirements.txt" },
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.mod" },
})

vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
})

vim.lsp.config("typescript-language-server", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript" },
})

-- Para a supresa geral de todos, java é o mais chato de configurar
local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
local debug_jar = vim.fn.expand(
  "$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar")
vim.lsp.config("jdtls", {
  cmd = { "jdtls", "--jvm-arg=-javaagent:" .. lombok_jar },
  init_options = { bundles = { debug_jar }},
  root_markers = { "gradlew" },
  filetypes = { "java" },
})

if not vim.g.lsp_disable then
  vim.lsp.enable {
    "clangd",
    "jdtls",
    "pylsp",
    "gopls",
    "rust-analyzer",
    "typescript-language-server",
  }
end
