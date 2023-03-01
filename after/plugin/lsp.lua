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

local ed = require('eduardo.utils')
local keys = vim.keymap.set

-- atalhos gerais para diagnósticos

local opts = { silent = true }
keys('n', '[d', vim.diagnostic.goto_prev, opts)
keys('n', ']d', vim.diagnostic.goto_next, opts)

ed.leader_keys({
  ['ll'] = vim.diagnostic.open_float,
  ['lq'] = vim.diagnostic.setloclist,
}, opts)

-- atalhos específicos de lsp, ativos somente quando há um servidor lsp

local function on_attach(client, bufnr)

  local opts = { silent = true, buffer = bufnr }
  keys('n', 'gD', vim.lsp.buf.declaration, opts)
  keys('n', 'gd', vim.lsp.buf.definition, opts)
  keys('n', 'gi', vim.lsp.buf.implementation, opts)
  keys('n', '<c-k>', vim.lsp.buf.signature_help, opts)

  ed.leader_keys({
    ['lh']  = vim.lsp.buf.hover,
    ['la']  = vim.lsp.buf.code_action,
    ['lr']  = vim.lsp.buf.rename,
    ['lwa'] = vim.lsp.buf.add_workspace_folder,
    ['lwr'] = vim.lsp.buf.remove_workspace_folder,
    ['lws'] = function ()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
  }, opts)

end

-- configuração do lsp em si, com autocomplete:

local lsp_conf = require('lspconfig')

local cap = require('cmp_nvim_lsp').default_capabilities()

local servidores = { 'clangd', 'pyright' }

for _, servidor in ipairs(servidores) do
  lsp_conf[servidor].setup {
    capabilities = cap,
    on_attach = on_attach,
  }
end
