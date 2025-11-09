-- lib/terminal.lua: biblioteca que permite manter um único terminal por aba,
-- com funções para utilizá-lo eficientemente

local autocmd = vim.api.nvim_create_autocmd

local M = { esc = "<c-\\><c-n>" }
M.group = vim.api.nvim_create_augroup("eduardo-terminal", {})

local function term_create()
  vim.cmd.term()
  local buf = vim.api.nvim_win_get_buf(0)
  vim.t.term = buf
  vim.t.termchan = vim.api.nvim_buf_get_option(buf, "channel")
  autocmd({ "TermClose", "BufDelete" }, {
    group = M.group, buffer = buf,
    callback = function() vim.t.term = nil end
  })
  autocmd({ "BufHidden", "WinClosed" }, {
    group = M.group, buffer = buf,
    callback = function() vim.t.termwin = nil end
  })
end

function M.open()
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

function M.send(cmd)
  local name = string.format("'%s'", vim.fn.expand "%:.")
  cmd = cmd:gsub("%%", name)
  cmd = vim.api.nvim_replace_termcodes(cmd .. "<cr>", true, true, true)
  M.open()
  vim.api.nvim_chan_send(vim.t.termchan, cmd)
end

return M
