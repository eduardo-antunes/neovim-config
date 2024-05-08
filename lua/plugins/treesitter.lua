-- O treesitter é um sistema originado no editor de código Atom e que hoje tem
-- suporte nativo no neovim. Ele oferece análise sintática em tempo real para
-- editores, o que facilita a criação de plugins mais sofisticados e melhor
-- colorização sintática. A lista de linguagens abaixo define quais parsers
-- (analisadores sintáticos) serão baixados e utilizados.

local linguagens = { "c", "cpp", "rust", "lua", "python", "go", "vimdoc" }

return {
  "nvim-treesitter/nvim-treesitter",
  ft = linguagens, build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
      ensure_installed = linguagens,
    }
  end
}
