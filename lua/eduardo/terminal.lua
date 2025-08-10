-- terminal.lua: configurações do terminal nativo do neovim.
-- Eu prefiro manter um único buffer de terminal por aba, que eu possa
-- facilmente acessar com um atalho de teclado. As funções aqui definem isso

local term_group = vim.api.nvim_create_augroup("eduardo-terminal", {})
local autocmd = vim.api.nvim_create_autocmd

local function term_create()
  vim.cmd.term()
  local buf = vim.api.nvim_win_get_buf(0)
  vim.t.term = buf
  vim.t.termchan = vim.api.nvim_buf_get_option(buf, "channel")
  autocmd({ "TermClose", "BufDelete" }, {
    group = term_group, buffer = buf,
    callback = function() vim.t.term = nil end
  })
  autocmd({ "BufHidden", "WinClosed" }, {
    group = term_group, buffer = buf,
    callback = function() vim.t.termwin = nil end
  })
end

local function term_open()
  if vim.t.termwin then
    vim.api.nvim_set_current_win(vim.t.termwin)
    vim.cmd.startinsert()
    return
  end
  vim.cmd.split()
  vim.t.termwin = vim.api.nvim_get_current_win()
  if vim.t.term then
    vim.api.nvim_win_set_buf(0, vim.t.term)
  else term_create() end
  vim.cmd.startinsert()
end

local function term_send(cmd)
  local name = string.format("'%s'", vim.fn.expand "%:.")
  cmd = cmd:gsub("%%", name)
  cmd = vim.api.nvim_replace_termcodes(cmd .. "<cr>", true, true, true)
  term_open()
  vim.api.nvim_chan_send(vim.t.termchan, cmd)
end

vim.keymap.set("n", "<leader>t", term_open                     )
vim.keymap.set("n", "<leader>r", function() term_send "!!" end )

--------------------------------------------------------------------------------

local term_esc = "<c-\\><c-n>"
local function term_bind(lhs, rhs)
  vim.keymap.set("t", lhs, rhs)
end

-- ESC sai do modo de terminal, aliases para atalhos do bash
term_bind("<esc>", term_esc)
term_bind("<a-l>", "<c-l>")
term_bind("<a-k>", "<c-k>")

-- Navegação entre janelas com CTRL + {h,j,k,l} no modo de terminal
term_bind("<c-k>", term_esc .. "<c-w>k")
term_bind("<c-j>", term_esc .. "<c-w>j")
term_bind("<c-h>", term_esc .. "<c-w>h")
term_bind("<c-l>", term_esc .. "<c-w>l")

-- Configurações visuais do buffer de terminal
autocmd("TermOpen",  { group = term_group, command = "setl nonu nornu scrolloff=0" })
autocmd("TermEnter", { group = term_group, command = "NoMatchParen" })
autocmd("TermLeave", { group = term_group, command = "DoMatchParen" })
