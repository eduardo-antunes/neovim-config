-- term.lua: configurações de gerência de terminais. Geralmente, só me
-- interessa que um terminal esteja ativo a qualquer momento, e eu quero poder
-- criá-lo ou, quando ele já existe, acessá-lo de maneira fácil e rápida.
-- "Um Terminal para a Todos Governar"

local function get_one_terminal()
  vim.cmd.split()
  -- Variável global 'one_terminal' armazena o ID de buffer do terminal único
  if one_terminal ~= nil then
    -- Terminal único existe, basta abrí-lo
    vim.api.nvim_win_set_buf(0, one_terminal)
  else
    -- Terminal único ainda não existe, deve ser criado
    vim.cmd.term()
    local win = vim.api.nvim_get_current_win()
    one_terminal = vim.api.nvim_win_get_buf(win)
    -- O terminal único deve ser fácil de fechar
    vim.keymap.set("t", "<c-c>", vim.cmd.quit, { buffer = one_terminal })
  end
  vim.cmd.startinsert() -- ativa o modo terminal
end

vim.keymap.set("n", "<leader><cr>", get_one_terminal) -- atalho conveniente
local term = vim.api.nvim_create_augroup("term", { clear = true })

-- Opções locais dos buffers de terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = term,
  callback = function ()
    -- Sem números de linha
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

-- Desativa highlighting de delimitadores correspondentes no modo terminal
vim.api.nvim_create_autocmd("TermEnter", {group=term,command="NoMatchParen"})
vim.api.nvim_create_autocmd("TermLeave", {group=term,command="DoMatchParen"})

vim.api.nvim_create_autocmd("TermClose", {
  group = term,
  callback = function ()
    -- Se o terminal único for fechado, é preciso tornar a variável que aponta
    -- para seu ID de buffer nula novamente, para que ele possa ser criado do
    -- zero da próxima
    one_terminal = nil
  end
})
