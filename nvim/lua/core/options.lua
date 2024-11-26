-- ~/.config/nvim/lua/core/options.lua

-- Configuración de Neovim básica
local opt = vim.opt  -- Alias para simplificar escritura

-- Configuración general
opt.number = true               -- Muestra los números de línea
opt.relativenumber = true       -- Números relativos para navegación eficiente
opt.wrap = false                -- Desactiva el ajuste de línea
opt.scrolloff = 8               -- Muestra un margen al hacer scroll
opt.sidescrolloff = 8           -- Margen horizontal al hacer scroll
opt.cursorline = true           -- Resalta la línea del cursor
opt.termguicolors = true        -- Habilita colores GUI para mejor apariencia
opt.signcolumn = "yes"          -- Siempre muestra la columna de signos
opt.clipboard = "unnamedplus"   -- Usa el portapapeles del sistema
opt.mouse = "a"                 -- Habilita el uso del mouse en todas las ventanas

-- Configuración de búsqueda
opt.ignorecase = true           -- Ignora mayúsculas/minúsculas en búsquedas
opt.smartcase = true            -- Respeta mayúsculas si se usan en la búsqueda
opt.hlsearch = true             -- Resalta resultados de búsqueda
opt.incsearch = true            -- Muestra resultados mientras escribes

-- Configuración de tabulación e indentación
opt.expandtab = true            -- Usa espacios en lugar de tabulaciones
opt.tabstop = 4                 -- Tamaño de un tabulador en espacios
opt.shiftwidth = 4              -- Número de espacios para auto-indentación
opt.softtabstop = 4             -- Ajusta el comportamiento del tabulador
opt.smartindent = true          -- Habilita auto-indentación inteligente

-- Configuración de tiempo y rendimiento
opt.updatetime = 300            -- Reduce el tiempo para actualizaciones (en ms)
opt.timeoutlen = 500            -- Tiempo de espera para combinaciones de teclas (en ms)

-- Configuración de ventanas y buffers
opt.splitright = true           -- Nuevas ventanas verticales se abren a la derecha
opt.splitbelow = true           -- Nuevas ventanas horizontales se abren abajo
opt.hidden = true               -- Permite mantener buffers abiertos en segundo plano

-- Configuración de visualización
opt.laststatus = 3              -- Barra de estado global (mejor para plugins de barra de estado)
opt.cmdheight = 1               -- Altura mínima de la línea de comandos
opt.showmode = false            -- Oculta el modo (útil si usas una barra de estado)

-- Configuración de archivos
opt.swapfile = false            -- Desactiva los archivos swap
opt.backup = false              -- Desactiva los backups
opt.undofile = true             -- Habilita el historial de deshacer persistente
opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Directorio para archivos de deshacer

-- Configuración de caracteres invisibles
opt.list = true                 -- Muestra caracteres invisibles
opt.listchars = { tab = "▸ ", trail = "·", extends = "→", precedes = "←", nbsp = "␣" }

-- Configuración adicional (opcional)
opt.completeopt = { "menu", "menuone", "noselect" } -- Opciones para autocompletado
opt.foldmethod = "indent"       -- Plegado basado en indentación
opt.foldlevel = 99              -- Abre todas las líneas por defecto
opt.iskeyword:append("-")       -- Considera palabras separadas por '-' como una sola

-- Opcional: Habilita símbolos para diagnostic (LSP)
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
})

-- Configuración del cursor
vim.opt.guicursor = {
    "n-v-c:block", -- Normal, visual y command-line: bloque
    "i-ci-ve:blinkwait100-blinkoff50-blinkon50", -- Insert, insert-completion y visual select: barra vertical
    "r-cr:hor20", -- Replace y command-line replace: subrayado
    "o:hor50", -- Operator-pending: subrayado
}
