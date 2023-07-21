-- Configurações para os plugins nvim-cmp e luasnip

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
    ["<cr>"]   = cmp.mapping.confirm { select = false },
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

-- Configurações para o lsp nativo do editor

-- Operações sobre diagnósticos nativos
local opts = { silent = true, remap = false }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)

-- Operações do cliente de lsp
local function on_attach(client, bufnr)
  local opts = { silent = true, buffer = bufnr, remap = false }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_cmption, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspcmpe_folder, opts)
  vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspcmpe_folder, opts)

  vim.keymap.set("n", "<leader>lws", function ()
    print(vim.inspect(vim.lsp.buf.list_workspcmpe_folders()))
  end, opts)
end

-- Configurações de servidores lsp externos

local servidores = { "clangd", "pyright", "gopls" }

local lsp_conf = require("lspconfig")
local cap = require("cmp_nvim_lsp").default_capabilities()
for _, servidor in ipairs(servidores) do
  lsp_conf[servidor].setup {
    capabilities = cap,
    on_attach = on_attach,
  }
end
