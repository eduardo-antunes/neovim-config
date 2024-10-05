-- eduardo/init.lua: esse arquivo é o ponto de partida da configuração, mas eu
-- não uso ele para configurar nada. Em vez disso, a configuração está divida
-- em diversos arquivos para fins de organização, e essa aqui só executa os
-- outros.

require("eduardo.keys")     -- define atalhos de teclado
require("eduardo.options")  -- configura opções do editor
require("eduardo.autocmd")  -- comandos automáticos
require("eduardo.plugins")  -- instala e carrega plugins
