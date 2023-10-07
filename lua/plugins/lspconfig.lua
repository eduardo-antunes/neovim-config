-- Configuração do lsp nativo, com autocomplete

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp"         ,
    "l3mon4d3/LuaSnip"         ,
    "hrsh7th/cmp-buffer"       ,
    "hrsh7th/cmp-nvim-lsp"     ,
    "saadparwaiz1/cmp_luasnip" ,
    "mfussenegger/nvim-jdtls"  , -- lsp para JAVA
  },
  config = function ()

    -- Configuração do autocomplete apenas
      local cmp = require("cmp")
      cmp.setup {
        mapping = {
          ["<tab>"]   = cmp.mapping(cmp.mapping.select_next_item()),
          ["<s-tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
          ["<c-b>"]   = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i","c"}),
          ["<c-f>"]   = cmp.mapping(cmp.mapping.scroll_docs(4), {"i","c"}),
          ["<c-space>"] = cmp.mapping(cmp.mapping.complete()),
          ["<c-y>"]   = cmp.config.disable,
          ["<c-e>"]   = cmp.mapping {
            ["i"] = cmp.mapping.abort(),
            ["c"] = cmp.mapping.close(),
          },
          ["<c-j>"]   = cmp.mapping.confirm { select = true },
        },
        snippet = {
          expand = function (args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources {
          {name = "nvim_lsp"},
          {name = "nvim_lua"},
          {name = "buffer"  },
          {name = "luasnip" },
        }
      }
      vim.keymap.set("i", "<c-n>", function ()
        require("luasnip").jump(1)
      end)

      -- Operações sobre diagnósticos nativos
      local opts = { silent = true, remap = false }
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)

      -- Operações do cliente de lsp
      local function on_attach(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        local opts = { silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)

        vim.keymap.set("n", "<leader>lws", function ()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
      end

      -- Configurações de servidores lsp externos

      local lsp_enable = true
      local servidores = { "clangd", "pyright", "gopls" }
      local blacklist = { "dwm", "dwmblocks", "dmenu" }

      -- Exceções especiais ao lsp
      local this_proj = vim.fn.fnamemodify(vim.loop.cwd(), ":t")
      for _, proj in ipairs(blacklist) do
        if this_proj == proj then
          lsp_enable = false
        end
      end

      local lsp_conf = require("lspconfig")
      local cap = require("cmp_nvim_lsp").default_capabilities()
      for _, servidor in ipairs(servidores) do
        if lsp_enable then
          lsp_conf[servidor].setup {
            capabilities = cap,
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
      local java_lsp = vim.api.nvim_create_augroup("JavaLSP", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
          group = java_lsp, pattern = "java",
          callback = function ()
            require("jdtls").start_or_attach(java_config)
          end
        })
  end
}
