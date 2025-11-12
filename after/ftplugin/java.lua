-- ftplugin/java.lua: configurações específicas para java, com focos em projetos
-- que utilizam gradle e spring boot

local term = require("eduardo.lib.terminal")

vim.keymap.set("n", "<localleader>b", function()
    term.send "./gradlew build"
end, { desc = "gradle build" })

vim.keymap.set("n", "<localleader>r", function()
    term.send "./gradlew bootRun"
end, { desc = "gradle run" })

vim.keymap.set("n", "<localleader>d", function()
    term.send "./gradlew bootRun --debug-jvm"
end, { desc = "gradle debug" })
