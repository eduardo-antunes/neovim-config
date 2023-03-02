-- Configurações para nvim-cmp (autocomplete):

local ac = require('cmp')

ac.setup {
  mapping = {
    ['<tab>']  = ac.mapping(ac.mapping.select_next_item()),
    ['<s-tab'] = ac.mapping(ac.mapping.select_prev_item()),
    ['<c-b>']  = ac.mapping(ac.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-f>']  = ac.mapping(ac.mapping.scroll_docs(4),  { 'i', 'c' }),
    ['<c-space'] = ac.mapping(ac.mapping.complete()),
    ['<c-y>']  = ac.config.disable,
    ['<c-e>']  = ac.mapping {
      ['i'] = ac.mapping.abort(),
      ['c'] = ac.mapping.close(),
    },
    ['<cr>']   = ac.mapping.confirm { select = false },
  },
  snippet = {
    expand = function (args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  sources = ac.config.sources {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer'   },
    { name = 'luasnip'  },
  }
}

-- Configurações para luasnip (snippets):

vim.keymap.set('i', '<c-n>', function ()
  require('luasnip').jump(1)
end)

-- Configurações para cliente nativo de lsp:

-- atalhos gerais para diagnósticos

local function nmap(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { silent = true })
end

nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)

nmap('<leader>ll', vim.diagnostic.open_float)
nmap('<leader>lq', vim.diagnostic.setloclist)

-- atalhos específicos de lsp, ativos somente quando há um servidor lsp

local function on_attach(client, bufnr)

  local function nmap(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { silent = true, buffer = bufnr })
  end

  nmap('gD', vim.lsp.buf.declaration)
  nmap('gd', vim.lsp.buf.definition)
  nmap('gi', vim.lsp.buf.implementation)
  nmap('<c-k>', vim.lsp.buf.signature_help)

  nmap('<leader>lh', vim.lsp.buf.hover)
  nmap('<leader>la', vim.lsp.buf.code_action)
  nmap('<leader>lr', vim.lsp.buf.rename)
  nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder)
  nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder)

  nmap('<leader>lws', function ()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)

end

-- configuração do lsp em si, com autocomplete:

local cap = require('cmp_nvim_lsp').default_capabilities()

local lsp_conf = require('lspconfig')

local servidores = { 'clangd', 'pyright' }

for _, servidor in ipairs(servidores) do
  lsp_conf[servidor].setup {
    capabilities = cap,
    on_attach = on_attach,
  }
end
