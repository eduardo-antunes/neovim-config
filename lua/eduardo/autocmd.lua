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

autocmd("ColorScheme", {
  group = e, pattern = "nightfly", callback = function()
    local none = { fg = "none" }
    vim.api.nvim_set_hl(0, "NightflyWatermelon" , none)
    vim.api.nvim_set_hl(0, "@variable.builtin"  , none)
    vim.api.nvim_set_hl(0, "@variable.parameter", none)
    vim.api.nvim_set_hl(0, "@boolean", { link = "NightflyGreen" })
  end
})

autocmd("ColorScheme", {
  group = e, pattern = "seoul256", callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { link = "StatusLineNC" })
    vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "Visual" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { link = "LineNr" })
  end
})

autocmd("FileType", {
  group = e, pattern = "markdown", callback = function(args)
    vim.keymap.set("n", "<localleader>c", "i```<cr>```<esc>kA", { buffer = args.buf })
  end
})
