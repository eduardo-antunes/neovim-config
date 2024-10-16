-- terminal.lua: configura um buffer de terminal persistente e único

local a = vim.api
local term = a.nvim_create_augroup("term", {})

-- Cria o terminal e define variáveis globais
local function create()
    vim.cmd.term()
    local buf = a.nvim_win_get_buf(0)
    -- Variáveis globais com o ID de buffer e de canal do terminal
    vim.g.term = buf vim.g.termchan = a.nvim_buf_get_option(buf, "channel")
    -- Quando o terminal é fechado, deve-se criar outro buffer para ele caso
    -- ele seja aberto novamente
    a.nvim_create_autocmd({ "TermClose", "BufDelete" }, {
        group = term, buffer = buf,
        callback = function() vim.g.term = nil end
    })
    -- O mesmo raciocínio aplica-se à janela onde ele é exibido
    a.nvim_create_autocmd({ "BufHidden", "WinClosed" }, {
        group = term, buffer = buf,
        callback = function() vim.g.termwin = nil end
    })
end

local this = {}

-- Abre o terminal único
function this.open()
    -- Se o terminal já está aberto em uma janela, basta alternar para ela
    if vim.g.termwin then
        a.nvim_set_current_win(vim.g.termwin)
        vim.cmd.startinsert() -- começa no modo de terminal
        return
    end
    -- Do contrário, deve-se abrir uma nova janela, colocando seu ID na
    -- variável g:termwin (para permitir reusos futuros)
    vim.cmd.split()
    vim.g.termwin = a.nvim_get_current_win()
    -- Se o buffer do terminal já existe, basta carregá-lo na janela; do
    -- contrário, deve-se criá-lo com a função term_create
    if vim.g.term then
        a.nvim_win_set_buf(0, vim.g.term)
    else create() end
    vim.cmd.startinsert() -- começa no modo de terminal
end

-- Envia um comando para o terminal único
function this.send(cmd)
    -- Processa o comando, substituindo '%'s pelo nome do buffer e substituindo
    -- códigos de terminal
    local name = string.format("'%s'", vim.fn.expand "%:.")
    cmd = cmd:gsub("%%", name)
    cmd = a.nvim_replace_termcodes(cmd .. "<cr>", true, true, true)
    -- Abre o terminal e envia o comando
    this.open()
    a.nvim_chan_send(vim.g.termchan, cmd)
end

return this
