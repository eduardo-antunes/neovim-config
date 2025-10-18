-- lsp.lua: configura o LSP para as linguagens e servidores que eu uso

local function toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("eduardo-lsp", {}),
  callback = function(args)
    vim.lsp.semantic_tokens.enable(false)
    vim.lsp.document_color.enable(false, args.buf)

    local pick = require("mini.extra").pickers.lsp
    vim.keymap.set("n", "gO", function() pick { scope = "document_symbol" } end)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition)
    vim.keymap.set("n", "grh", toggle_hints)
  end
})

vim.lsp.config("*", { root_markers = { ".git" } })

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json" },
})

-- O lombok é uma ótima biblioteca para facilitar a programação em java,  mas
-- é preciso "avisar" ao jdtls que ela vai ser usada
local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
vim.lsp.config("jdtls", {
  cmd = { "jdtls", "--jvm-arg=-javaagent:" .. lombok_jar },
  filetypes = { "java" },
  root_markers = { "gradlew" },
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

if not vim.g.lsp_disable then
  vim.lsp.enable { "clangd", "jdtls", "pylsp", "gopls", "rust-analyzer" }
end
