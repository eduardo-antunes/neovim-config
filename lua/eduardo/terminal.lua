-- terminal.lua: configura um buffer de terminal persistente e único. Ele
-- possui ainda um comando gravado, armazenado em g:termrec, que pode ser
-- rapidamente editado e executado

local a = vim.api
local term = a.nvim_create_augroup("term", {})

-- Cria o terminal e define variáveis globais
local function term_create()
    vim.cmd.term()
    local buf = a.nvim_win_get_buf(0)
    -- Variáveis globais com o ID de buffer e de canal do terminal
    vim.g.term = buf vim.g.termchan = a.nvim_buf_get_option(buf, "channel")
    -- Quando o terminal é fechado, deve-se criar outro buffer para ele caso
    -- ele seja aberto novamente
    a.nvim_create_autocmd("TermClose", {
        group = term, buffer = buf,
        callback = function() vim.g.term = nil end
    })
    -- O mesmo raciocínio aplica-se à janela onde ele é exibido
    a.nvim_create_autocmd("BufHidden", {
        group = term, buffer = buf,
        callback = function() vim.g.termwin = nil end
    })
end

-- Abre o terminal único
local function term_open()
    -- Se o terminal já está aberto em uma janela, basta alternar para ela
    if vim.g.termwin then
        a.nvim_set_current_win(vim.g.termwin)
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
    else term_create() end
    vim.cmd.startinsert() -- gosto de começar no modo de inserção sempre
end

-- Envia um comando para o terminal único
local function term_send(command)
    term_open()
    command = a.nvim_replace_termcodes(command .. "<cr>", true, true, true)
    a.nvim_chan_send(vim.g.termchan, command)
end

-- Permite a edição do comando gravado e então o envia
local function term_edit()
    local command = vim.g.termrec or ""
    command = vim.fn.input("$ ", command, "shellcmd")
    if command == "" then return end -- operação cancelada
    vim.g.termrec = command
    term_send(command)
end

-- Executa o comando gravando sem editá-lo (a não ser que esteja vazio)
local function term_rec()
    if not vim.g.termrec then term_rec_edit()
    else term_send(vim.g.termrec) end
end

-- Atalhos de teclado
vim.keymap.set("n", "<leader><cr>", term_open)
vim.keymap.set("n", "<leader>m", term_edit)
vim.keymap.set("n", "<leader>r", term_rec)
