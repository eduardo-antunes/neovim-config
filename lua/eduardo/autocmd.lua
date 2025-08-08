-- autocmd.lua: comandos automáticos, executados em resposta a eventos

local e = vim.api.nvim_create_augroup("eduardo", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

autocmd("TermOpen",  { group = e, command = "setl nonu nornu scrolloff=0" })
autocmd("TermEnter", { group = e, command = "NoMatchParen" })
autocmd("TermLeave", { group = e, command = "DoMatchParen" })

autocmd("ColorScheme", {
  group = e, callback = function()
    -- Eu realmente não gosto da colorização sintática do LSP
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})
