-- O treesitter.nvim facilita o uso do suporte nativo ao treesitter, um sistema
-- de análise sintática em tempo real muito massa

local linguagens = { "c", "cpp", "rust", "lua", "python", "go", "vimdoc" }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
      ensure_installed = linguagens,
    }
  end
}
