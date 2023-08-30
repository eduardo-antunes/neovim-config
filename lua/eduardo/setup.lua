-- Setup básico do sistema de plugins e teclas líderes

-- Depois que o packer.nvim foi deprecado, passei a utilizar o lazy.nvim para
-- a instalação e gerenciamento de plugins. Ele é bem melhor, pra ser sincero.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- release estável do lazy
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local config = {}
config.ui = {
  icons = {
    cmd = "⌘",
    config = "🛠",
    event = "📅",
    ft = "📂",
    init = "⚙",
    keys = "🗝",
    plugin = "🔌",
    runtime = "💻",
    source = "📄",
    start = "🚀",
    task = "📌",
    lazy = "💤 ",
  }
}

-- Essa linha configura a interface do lazy e carrega os plugins
require("lazy").setup("plugins", config)
