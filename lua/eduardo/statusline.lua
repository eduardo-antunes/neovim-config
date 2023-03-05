-- Statusline caseira :)
-- Baseado no excelente artigo em https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local fmt = string.format
local this = {}

-- Tabelas que definem o visual da statusline:

local mode_symbols = {
  ['n']  = 'N',
  ['no'] = 'N',
  ['nt'] = 'N',
  ['v']  = 'V',
  ['V']  = 'Vl',
  [''] = 'Vb',
  ['s']  = 'S',
  ['S']  = 'Sl',
  [''] = 'Sb',
  ['i']  = 'I',
  ['ic'] = 'I',
  ['R']  = 'R',
  ['Rv'] = 'Vr',
  ['c']  = 'C',
  ['cv'] = 'Ex',
  ['ce'] = 'Ex',
  ['r']  = 'P',
  ['rm'] = 'M',
  ['r?'] = '?',
  ['!']  = '$',
  ['t']  = 'T',
}

local lsp_symbols = {
  errors   = 'E',
  warnings = 'W',
  hints    = 'H',
  info     = 'I',
}

-- A statusline pode ser pensada como uma sequência de módulos, em que cada
-- um é responsável pela apresentação de uma informação em particular. Cada
-- módulo é representado, nessa statusline, por uma função que não recebe
-- argumentos e retorna uma string.

-- Pseudo-módulo; adiciona espaçamento na statusline
local spacer = '%=%#StatusLineExtra#'

-- Exibe o tipo de arquivo
local function filetype()
  return fmt(' %s ', vim.bo.filetype)
end

-- Exibe o símbolo do modo atual, no estilo evil-mode
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return fmt(' <%s> |', mode_symbols[current_mode])
end

-- Exibe o branch atual do git, se estiver em um repositório
local function git()
  local branch = vim.fn.system { 'git', 'symbolic-ref', '--short', 'HEAD' }
  if branch:find('^fatal:.*$') then return '' end
  return fmt(' git: %s |', branch:gsub('%s+', ''))
end

-- Exibe a posição do cursor no arquivo
local function position()
  if vim.bo.filetype == 'alpha' then
    return ''
  end
  return '| %P | %l:%c '
end

-- Exibe o status do arquivo
local function file_status()
  if not vim.bo.modifiable or vim.bo.readonly then
    return ' [-] '
  end
  if vim.bo.modified then
    return ' [+] '
  end
  return ''
end

-- Exibe o caminho do arquivo
local function filepath()
  local dir = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
  local name = vim.fn.expand '%:t'

  if dir == '.' then
    return fmt(' %s', name)
  end
  if name == '' then
    return ' '
  end

  return fmt(' %%<%s/%s ', dir, name)
end

-- Bastante complicação adiante

-- Exibe informação do cliente lsp, se houver
local function lsp()
  local count  = {}
  local levels = { 
    errors   = 'Error', 
    warnings = 'Warn', 
    hints    = 'Hint',
    info     = 'Info', 
  }

  for k, level in pairs(levels) do
    local diagnostics = vim.diagnostic.get(0, { severity = level })
    count[k] = vim.tbl_count(diagnostics)
  end

  local output = ' '
  if count.errors ~= 0 then
    output = fmt('%s%s:%s ', output, lsp_symbols.errors, count.errors)
  end
  if count.warnings ~= 0 then
    output = fmt('%s%s:%s ', output, lsp_symbols.warnings, count.warnings)
  end
  if count.hints ~= 0 then
    output = fmt('%s%s:%s ', output, lsp_symbols.hints, count.hints)
  end
  if count.info ~= 0 then
    output = fmt('%s%s:%s ', output, lsp_symbols.info, count.info)
  end

  return output
end

-- A statusline pode estar em dois estados: ativo, que é exibido em janelas
-- que tenham o foco, e inativo, que é exibido em janelas que não tenham esse
-- foco. O estado ativo compõe os módulo definidos acima, enquanto o inativo
-- é mais resumido. Ambos são representados por funções que não recebem
-- argumentos e retornam uma string.

function this.active()
  return table.concat {
    mode(),
    git(),
    filepath(),
    file_status(),
    lsp(),
    spacer,
    filetype(),
    position(),
  }
end

function this.inactive()
  return ' %F'
end

function this.setup()
  local augroup = vim.api.nvim_create_augroup('StatusLine', { clear = true })
  vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
      group = augroup,
      command = "setlocal statusline=%!v:lua.require'eduardo.statusline'.active()",
    })
  vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
      group = augroup,
      command = "setlocal statusline=%!v:lua.require'eduardo.statusline'.inactive()",
    })
end

return this
