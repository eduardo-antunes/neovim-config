-- treesitter.lua: instala e configura o nvim-treesitter, que automatiza a
-- instalação e configurações de parsers de treesitter. Eles fornecem análise
-- sintática incremental e em tempo real

local p = { "c", "cpp", "rust", "lua", "python", "go", "vimdoc", "markdown" }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = p,
      auto_install = false,
      highlight = { enable = true }, -- melhor colorização sintática
    }
  end
}
