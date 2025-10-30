-- plugins/dap.lua: configura depuração no neovim via nvim-dap. O DAP é um
-- protocolo similar ao LSP, mas com foco específico em depuradores

local function dap_bind(lhs, rhs)
  vim.keymap.set("n", "<leader>D" .. lhs, rhs)
end

dap_bind("c", function() require("dap").continue() end)
dap_bind("s", function() require("dap").step_over() end)
dap_bind("i", function() require("dap").step_into() end)
dap_bind("o", function() require("dap").step_over() end)
dap_bind("b", function() require("dap").toggle_breakpoint() end)
dap_bind("r", function() require("dap").repl_open() end)
dap_bind("l", function() require("dap").repl_open() end)
dap_bind("h", function() require("dap.ui.widgets").hover() end)
dap_bind("p", function() require("dap.ui.widgets").preview() end)

dap_bind("L", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Mensagem: "))
end)

dap_bind("f", function()
  local w = require("dap.ui.widgets")
  w.centered_float(w.frames)
end)

dap_bind("s", function()
  local w = require("dap.ui.widgets")
  w.centered_float(w.scopes)
end)
