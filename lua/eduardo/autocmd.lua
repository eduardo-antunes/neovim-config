-- autocmd.lua: configura alguns comandos automáticos

local e = vim.api.nvim_create_augroup("eduardo", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = e, callback = function()
    vim.highlight.on_yank()
  end
})

autocmd("ColorScheme", {
  group = e, callback = function()
    -- Eu realmente não gosto da colorização sintática que o LSP aplica
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})

autocmd("FileType", {
  group = e, pattern = "markdown", callback = function(args)
    -- TODO substituir isso por um snippet de verdade
    vim.keymap.set("n", "<localleader>c", "i```<cr>```<esc>kA", {
      buffer = args.buf
    })
  end
})
