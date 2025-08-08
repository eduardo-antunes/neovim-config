-- terminal.lua: configura um buffer de terminal persistente e único

local a = vim.api
local term = { esc = "<c-\\><c-n>" }
local term_group = a.nvim_create_augroup("eduardo-terminal", {})

function term.create()
    vim.cmd.term()
    local buf = a.nvim_win_get_buf(0)
    vim.t.term = buf
    vim.t.termchan = a.nvim_buf_get_option(buf, "channel")
    a.nvim_create_autocmd({ "TermClose", "BufDelete" }, {
        group = term_group, buffer = buf,
        callback = function() vim.t.term = nil end
    })
    a.nvim_create_autocmd({ "BufHidden", "WinClosed" }, {
        group = term_group, buffer = buf,
        callback = function() vim.t.termwin = nil end
    })
end

function term.open()
    if vim.t.termwin then
        a.nvim_set_current_win(vim.t.termwin)
        vim.cmd.startinsert()
        return
    end
    vim.cmd.split()
    vim.t.termwin = a.nvim_get_current_win()
    if vim.t.term then
        a.nvim_win_set_buf(0, vim.t.term)
    else term.create() end
    vim.cmd.startinsert()
end

function term.send(cmd)
    local name = string.format("'%s'", vim.fn.expand "%:.")
    cmd = cmd:gsub("%%", name)
    cmd = a.nvim_replace_termcodes(cmd .. "<cr>", true, true, true)
    term.open()
    a.nvim_chan_send(vim.t.termchan, cmd)
end

return term
