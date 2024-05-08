-- init.lua: é o ponto de partida da config. Ele se destina
-- exclusivamente a carregar o restante da configuração, composta
-- por arquivos de propósito específico

require("eduardo.keys")     -- atalhos de teclado
require("eduardo.plugins")  -- carrega plugins
require("eduardo.options")  -- configuração de opções
require("eduardo.terminal") -- configurações de terminal
require("eduardo.autocmd")  -- comandos automáticos
