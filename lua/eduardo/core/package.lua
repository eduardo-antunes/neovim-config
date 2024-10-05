-- package.lua: gerenciador de pacotes muito simples para o neovim. Ele busca
-- combinar o estilo declarativo do lazy.nvim com uma abordagem muito mais
-- simplista, que para mim já é suficiente. Feito para estudo

local l, err = vim.loop, vim.api.nvim_err_writeln
local pack_path = string.format("%s/site/pack/eduardo/opt", vim.fn.stdpath "data")

-- Converte uma URL curta em uma URL completa do github
local function from_github(short_url)
  return string.format("https://github.com/%s.git", short_url)
end

-- Clona um repositório de forma assíncrona, executando o código desejado caso
-- a operação finalize corretamente. Clone raso para não gastar memória demais
local function clone(name, url, on_success)
  local args = { "clone", "--depth=1", url, name }
  local callback = vim.schedule_wrap(function(code)
    if code == 0 then on_success()
    else err(string.format("[!] Erro ao tentar clonar %s", name))
    end
  end)
  l.spawn("git", { args=args, cwd=pack_path }, callback)
end

-- Atualiza um repositório de forma assíncrona, executando o código desejado
-- caso a operação finalize corretamente. Atualização simples e rasa
local function update(name, path, on_success)
  local args = { "pull", "--update-shallow", "--ff-only" }
  local callback = vim.schedule_wrap(function(code)
    if code == 0 then on_success()
    else err(string.format("[!] Erro ao tentar atualizar %s", name))
    end
  end)
  l.spawn("git", { args=args, cwd=path }, callback)
end

-- Compila o plugin dado, caso seja necessário
local function build(plugin)
  if not plugin.build then return end
  -- Se o comando de compilação começa com :, é um comando do vim
  if plugin.build:find(":", 1, true) == 1 then
    vim.cmd(plugin.build:sub(2))
    return
  end
  -- Do contrário, é um comando externo que deve ser executado de forma
  -- assíncrona, pois pode ter uma execução demorada
  local callback = vim.schedule_wrap(function(code)
    if code ~= 0 then
      err(string.format("[!] Erro ao tentar compilar %s", plugin.name))
    end
  end)
  l.spawn(plugin.build, { cwd=plugin.path }, callback)
end

-- Carrega o plugin dado, executando sua configuração (de forma segura)
local function load(plugin)
  vim.cmd(string.format("packadd! %s", plugin.name))
  -- A configuração é dada na forma de duas chaves: opts, que contém um
  -- argumento que deve ser dado à função setup do plugin, e config, que
  -- contém uma função que deve ser executada
  if plugin.opts then
      local mod = plugin.name:gsub("^(.*)%.nvim$", "%1")
      pcall(function() require(mod).setup(plugin.opts) end)
      plugin.opts = nil -- liberar espaço
  end
  if plugin.config then
      pcall(plugin.config)
  end
end

-- Converte uma declaração simples de plugin em uma declaração completa
local function complete(plugin)
  if not plugin.name then
    _, _, plugin.name = plugin[1]:find("^[^ /]+/([^ /]+)$")
  end
  plugin.path = string.format("%s/%s", pack_path, plugin.name)
  return plugin
end

local this = {}

-- A partir de uma declaração de plugin,essa função o instala (caso já não
-- esteja instalado) e o carrega. Usada implicitamente pela função setup
function this.use(plugin)
  -- Se a chave require estiver presente, ela contém um arquivo cuja execução
  -- produzirá a declaração de plugin
  if plugin.require then
    plugin = require(plugin.require)
  end
  -- "Completa" a declaração e insere-a na lista global de plugins
  plugin = complete(plugin)
  table.insert(this.plugins, plugin)
  -- Carrega o plugin caso ele já esteja instalado
  if vim.loop.fs_stat(plugin.path) then
    load(plugin)
    return
  end
  -- Senão, faz a instalação e então o carrega
  local url = from_github(plugin[1])
  clone(plugin.name, url, function()
    build(plugin)
    load(plugin)
  end)
end

-- Atualiza todos os plugins
function this.update_all()
  for _, plugin in ipairs(this.plugins) do
    update(plugin.name, plugin.path, function()
      build(plugin)
      vim.print(string.format("%s atualizado!", plugin.name))
    end)
  end
end

-- Comunica algumas informações sobre os plugins instalados
function this.status()
  vim.print(string.format("%d plugins instalados:", #this.plugins))
  for _, plugin in ipairs(this.plugins) do
    vim.print(string.format("* %s", plugin.name))
  end
end

-- Inicializa o package.lua com uma lista de declarações de plugins; esses
-- plugins serão instalados (se necessário) e carregados
function this.setup(plugins)
  this.plugins = {}
  vim.fn.mkdir(pack_path, "p")
  for _, plugin in ipairs(plugins) do
    this.use(plugin)
  end
  -- Define alguns comandos de usuário e atalhos para facilitar a minha vida
  vim.api.nvim_create_user_command("PacUpdate", this.update_all, {})
  vim.api.nvim_create_user_command("PacStatus", this.status, {})
  vim.keymap.set("n", "<leader>P", string.format("<cmd>edit %s<cr>", pack_path))
end

return this
