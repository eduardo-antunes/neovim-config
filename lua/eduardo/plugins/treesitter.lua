-- plugins/treesitter.lua: configura o plugin nvim-treesitter

local langs = { "c", "cpp", "rust", "lua", "python", "go", "vimdoc",
  "markdown", "java", "javascript", "typescript" }

require("nvim-treesitter.configs").setup {
  ensure_installed = langs,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("eduardo-ts", {}),
  callback = function(ev)
    if ev.name == "nvim-treesitter" then
      require("nvim-treesitter").update()
    end
  end
})
