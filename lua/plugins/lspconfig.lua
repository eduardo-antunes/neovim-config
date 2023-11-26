-- Configuração do lsp nativo

return {
  "neovim/nvim-lspconfig",
  dependencies = "mfussenegger/nvim-jdtls", -- para JAVA
  config = function ()
      local on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil

        local atalhos = {
          ["gD"] = vim.lsp.buf.declaration,
          ["gd"] = vim.lsp.buf.definition,
          ["gi"] = vim.lsp.buf.definition,
          ["<leader>lf"] = vim.lsp.buf.format,
          ["<leader>lh"] = vim.lsp.buf.hover,
          ["<leader>la"] = vim.lsp.buf.code_action,
          ["<leader>lr"] = vim.lsp.buf.rename,
          ["<leader>lwa"] = vim.lsp.buf.add_workspace_folder,
          ["<leader>lwr"] = vim.lsp.buf.remove_workspace_folder,
          ["<leader>lws"] = function ()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end
        }
        for lhs, rhs in pairs(atalhos) do
          vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr })
        end
      end

      -- Configurações de servidores lsp externos
      local lsp_ativo = true
      local servidores = { "clangd", "pyright", "gopls" }
      local projetos_inativos = { "dwm", "dwmblocks", "dmenu" }

      -- Exceções especiais ao lsp
      local esse_proj = vim.fn.fnamemodify(vim.loop.cwd(), ":t")
      for _, proj in ipairs(projetos_inativos) do
        if esse_proj == proj then
          lsp_ativo = false
        end
      end

      local lsp_conf = require("lspconfig")
      for _, servidor in ipairs(servidores) do
        if lsp_ativo then
          lsp_conf[servidor].setup {
            on_attach = on_attach,
          }
        end
      end

      -- Configuração específica para Java
      local java_config = {
        cmd = { "jdtls" },
        on_attach = on_attach,
        root_dir = vim.fs.dirname(vim.fs.find({"gradlew", ".git", "mvnw"}, { upward = true })[1])
      }
      vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          group = vim.api.nvim_create_augroup("JavaLSP", {}),
          callback = function ()
            require("jdtls").start_or_attach(java_config)
          end
        })
  end
}
