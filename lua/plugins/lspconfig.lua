-- Configuração do client LSP nativo do neovim, feita com o auxílio do plugin
-- oficial nvim-lspconfig. O plugin reduz a verbosidade da configuração a quase
-- zero para os servidores mais comuns. A lista s abaixo define os servidores
-- que eu utilizo que não precisam de nenhuma configuração extra além de
-- atalhos de teclado.

local s = { "clangd", "pylsp", "gopls" }

local atalhos = {
  -- Atalhos de teclado específicos para buffers com LSP ativo, dão acesso às
  -- operações mais comuns realizadas junto aos servidores.
  ["gD"] = vim.lsp.buf.declaration,
  ["gd"] = vim.lsp.buf.definition,
  ["gi"] = vim.lsp.buf.definition,
  ["<leader>lf"] = vim.lsp.buf.format,
  ["<leader>lh"] = vim.lsp.buf.hover,
  ["<leader>la"] = vim.lsp.buf.code_action,
  ["<leader>lr"] = vim.lsp.buf.rename,
}

local function on_attach(cliente, buf_id)
  -- Essa função é executada sempre que um servidor conecta-se a um buffer. Eu
  -- simplesmente a utilizo para configurar os atalhos definidos acima.
  for lhs, rhs in pairs(atalhos) do
    vim.keymap.set("n", lhs, rhs, { silent = true, buffer = buf_id })
  end
end

return {
  "neovim/nvim-lspconfig", -- plugin geral de LSP
  dependencies = "mfussenegger/nvim-jdtls", -- plugin específico para java
  ft = { "c", "cpp", "python", "go", "java" },
  config = function ()

    -- Sob o plugin de LSP nvim-lspconfig, toda a configuração necessária para
    -- os servidores na lista s é feita por esse pequeno bloco de código.
    local lsp_conf = require("lspconfig")
    for _, servidor in ipairs(s) do
      lsp_conf[servidor].setup { on_attach = on_attach }
    end

    -- A linguagem java, desnecessariamente complicada do jeito que só ela
    -- mesmo sabe ser, precisa de um plugin específico para configurar o seu
    -- servidor LSP. Isso porque esse plugin introduz extensões em relação ao
    -- setup básico que aliviam um pouco o sofrimento de escrever java,
    -- incluindo geração automática de getters e setters.
    local j = { "gradlew", ".git", "mvnw" }
    local raiz_java = vim.fs.dirname(vim.fs.find(j, {upward = true})[1])
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        group = vim.api.nvim_create_augroup("odeio-java", {}),
        callback = function ()
          require("jdtls").start_or_attach {
            cmd = { "jdtls" },
            on_attach = on_attach,
            root_dir = raiz_java,
          }
        end
      })
  end
}
