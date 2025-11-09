-- autocmd.lua: configura alguns comandos automáticos

local autocmd = vim.api.nvim_create_autocmd
local e = vim.api.nvim_create_augroup("eduardo", {})
local t = require("eduardo.lib.terminal").group

autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

autocmd("ColorScheme", {
  group = e, callback = function()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})

autocmd("TermOpen", {
  group = t, callback = function()
    vim.wo.scrolloff = 0
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
})

autocmd("TermEnter", { group = t, command = "NoMatchParen" })
autocmd("TermLeave", { group = t, command = "DoMatchParen" })
