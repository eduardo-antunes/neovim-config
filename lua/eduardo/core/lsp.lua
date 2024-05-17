-- lsp.lua: biblioteca de configuração do cliente nativo de LSP. Usa apenas a
-- api nativa, sem nvim-lspconfig. Os métodos daqui são usados em autocmd.lua
-- para configurar linguagens específicas

local lsp = vim.lsp
local a = vim.api
local this = {}

-- Define atalhos de teclado para operações do lsp e configura o cliente;
-- feito para ser executado no evento LspAttach
function this.conf(args)
  -- Atalhos de teclado específicos, usando o telescope
  local t = require("telescope.builtin")
  local atalhos = {
    ["gd"] = t.lsp_definitions,
    ["gr"] = t.lsp_references,
    ["gI"] = t.lsp_implementations,
    ["gD"] = lsp.buf.declaration,
    ["<leader>ct"] = t.lsp_type_definitions,
    ["<leader>cs"] = t.lsp_document_symbols,
    ["<leader>cf"] = lsp.buf.format,
    ["<leader>ch"] = lsp.buf.hover,
    ["<leader>ca"] = lsp.buf.code_action,
    ["<leader>cr"] = lsp.buf.rename,
  }
  for lhs, rhs in pairs(atalhos) do
    -- Atalhos são locais ao buffer conectado
    vim.keymap.set("n", lhs, rhs, { buffer = args.buf })
  end
  -- Não curto muito esse recurso dos tokens semânticos
  local c = lsp.get_client_by_id(args.data.client_id)
  c.server_capabilities.semanticTokensProvider = nil
end

-- Conecta o buffer atual ao cliente de LSP. Recebe o nome do seguidor, um
-- conjunto de padrões que indicam a raiz de um projeto qualquer na linguagem
-- (o diretório .git é usado como fallback), e argumentos e configurações
-- extras para o servidor (opcionalmente)
function this.attach(server, root_pattern, flags, settings)
  -- O LSP pode ser globalmente desligado na minha configuração definindo
  -- a variável g:lsp_disable, com qualquer valor
  if vim.g.lsp_disable then return end
  if vim.fn.executable(server) ~= 1 then
    local err = string.format("[!] Servidor %s não encontrado", server)
    a.nvim_err_writeln(err)
    return 1 -- erro
  end

  -- Se o parâmetro flags for dado, ele deve ser combinado com o nome do
  -- servidor para formar o comando
  local cmd = flags or { server } and vim.tbl_flatten { server, flags }
  -- A raiz do projeto é encontrado procurando pelos padrões
  table.insert(root_pattern, ".git")
  local root = vim.fs.dirname(vim.fs.find(root_pattern, { upward = true })[1])
  -- A função lsp.start reutiliza um cliente adequado caso já exista, então
  -- pode-se usá-la incondionalmente para conectar buffers a servidores
  local client = vim.lsp.start {
    name = server, cmd = cmd, root_dir = root,
    settings = settings -- configurações específicas do servidor
  }
  return 0
end

return this
