-- plugins/pick.lua: configura o mini.pick, um seletor genérico, leve e
-- flexível; parte do mini.nvim que eu mais configuro

local pick = require("mini.pick")

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  local row = math.floor(0.5 * (vim.o.lines - height))
  local col = math.floor(0.5 * (vim.o.columns - width))
  return {
    row = row, col = col,
    width = width, height = height,
    anchor = "NW",
    style  = "minimal",
    border = "rounded",
  }
end

pick.setup {
  source = { show = pick.default_show },
  window = { config = win_config }
}
vim.ui.select = pick.ui_select

-- Os atalhos C-f e C-b já tem funções pré-definidas no vim, mas eu não as
-- utilizo, então pra mim faz mais sentido sobreescrevê-las
vim.keymap.set("n", "<c-f>", pick.builtin.files)
vim.keymap.set("n", "<c-b>", pick.builtin.buffers)
vim.keymap.set("n", "<leader>h", pick.builtin.help)

-- Seletores customizados ------------------------------------------------------

local u = require("eduardo.utils")

-- Pesquisa em arquivos com caminhos truncados
vim.keymap.set("n", "<leader>f", function()
  local original_paths = {}
  local choose = function(path)
    pick.default_choose(original_paths[path])
  end
  local opts = { source = { choose = choose } }

  pick.builtin.cli({
    command = { "rg", "--files" },
    postprocess = function(paths)
      local items = {}
      for _, path in ipairs(paths) do
        if path == "" then break end

        local dir = vim.fn.fnamemodify(path, ":h:t")
        local name = vim.fn.fnamemodify(path, ":t")
        local new_path = (dir ~= ".")
          and string.format("%s/%s", dir, name)
          or name
        table.insert(items, new_path)
        original_paths[new_path] = path
      end
      return items
    end,
  }, opts)
end)

-- Pesquisa apenas arquivos sob o diretório atual
vim.keymap.set("n", "<leader>.", function()
  local original_paths = {}
  local choose = function(path)
    pick.default_choose(original_paths[path])
  end
  local opts = { source = { choose = choose } }

  local dir = vim.fn.expand("%:h")
  pick.builtin.cli({
    command = { "rg", "--files", dir },
    postprocess = function(paths)
      local items = {}
      local prefix_len = u.common_prefix_len(paths)
      for _, path in ipairs(paths) do
        if path == "" then break end
        local new_path = path:sub(prefix_len + 1)
        original_paths[new_path] = path
        table.insert(items, new_path)
      end
      return items
    end
  }, opts)
end)
