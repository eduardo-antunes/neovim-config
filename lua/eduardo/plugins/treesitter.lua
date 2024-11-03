-- treesitter.lua: instala e configura o nvim-treesitter, que automatiza a
-- instalação e configurações de parsers de treesitter. Eles fornecem análise
-- sintática incremental e em tempo real

local langs = { "c", "cpp", "rust", "lua", "python", "go", "vimdoc",
  "markdown", "java", "javascript", "typescript" }

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = langs,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
