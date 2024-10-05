-- A linguagem java e seu ecossistema são realmente uma peça rara. Para que
-- desenvolver em java seja uma experiência minimamente decente, um plugin
-- dedicado é necessário, além do servidor LSP jdtls. Maldito Gosling

return {
  "mfussenegger/nvim-jdtls",
  config = function ()
    local p = { ".git", "gradlew", "mvnw" }
    local gosling = vim.api.nvim_create_augroup("jdtls", {})
    vim.api.nvim_create_autocmd("FileType", {
      group = gosling, pattern = "java", callback = function()
        if vim.g.lsp_disable or vim.fn.executable "jdtls" ~= 1 then return end
        require("jdtls").start_or_attach {
          cmd = { "jdtls" },
          root_dir = vim.fs.dirname(vim.fs.find(p, { upward = true})[1]),
        }
      end
    })
  end
}
