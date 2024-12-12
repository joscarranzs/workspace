-- ~/.config/nvim/lua/core/keymaps.lua

-- Asignar la tecla líder(leader key)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Función para limpiar y formatear archivos
vim.api.nvim_create_user_command("CleanAndFormat", function()
    -- Guardar la posición actual del cursor
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Eliminar caracteres no deseados como ^M(si existen)
    vim.cmd([[%s/\r//ge]])-- Reemplaza ^M en todo el archivo(el modificador 'e' suprime errores si no se encuentra nada)

    -- Reindentar todo el archivo
    vim.cmd("normal gg=G")-- Aplica reindentación global

    -- Restaurar la posición del cursor
    vim.api.nvim_win_set_cursor(0, cursor_pos)

    -- Guardar el archivo
    vim.cmd("write")
end,{})

-- Vincular la función al mapeo de teclas(líder + s)
vim.api.nvim_set_keymap("n", "<leader>s", ":CleanAndFormat<CR>",{noremap = true, silent = true})

-- Mapeos básicos(por si no estaban configurados antes)
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>",{noremap = true, silent = true})-- Guardar
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>",{noremap = true, silent = true})-- Salir
vim.api.nvim_set_keymap("n", "<leader>x", ":wq<CR>",{noremap = true, silent = true})-- Guardar y salir
vim.api.nvim_set_keymap("n", "<leader>Q", ":qa!<CR>",{noremap = true, silent = true})-- Salir sin guardar

-- Mapeo para refresh de DBUI
vim.api.nvim_set_keymap('n', 'R', '<Plug>(DBUI_Refresh)',{noremap = true, silent = true})

-- Asignaciones de teclas para Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>",{noremap = true, silent = true, desc = "Buscar archivos"})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",{noremap = true, silent = true, desc = "Buscar texto en archivos"})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>",{noremap = true, silent = true, desc = "Listar buffers abiertos"})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",{noremap = true, silent = true, desc = "Buscar en la ayuda"})

-- Mapear <Leader>o para insertar una nueva línea limpia debajo sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>o", "o<Esc>0D",{noremap = true, silent = true})

-- Mapear <Leader>O para insertar una nueva línea limpia arriba sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>O", "O<Esc>0D",{noremap = true, silent = true})

-- Nueva pestaña
vim.api.nvim_set_keymap("n", "te", ":Telescope find_files<CR>:tabedit<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>",{noremap = true, silent = true})

-- Mapeos de teclas para redimensionar ventanas más significativamente usando combinaciones con la tecla líder
vim.api.nvim_set_keymap("n", "<leader>rl", "5<C-w><",{noremap = true, silent = true})-- Redimensionar ventana hacia la izquierda más
vim.api.nvim_set_keymap("n", "<leader>rr", "5<C-w>>",{noremap = true, silent = true})-- Redimensionar ventana hacia la derecha más
vim.api.nvim_set_keymap("n", "<leader>rt", "5<C-w>+",{noremap = true, silent = true})-- Redimensionar ventana hacia arriba más
vim.api.nvim_set_keymap("n", "<leader>rd", "5<C-w>-",{noremap = true, silent = true})-- Redimensionar ventana hacia abajo más

-- Mapeos de teclas para moverse entre ventanas usando combinaciones con la tecla líder
vim.api.nvim_set_keymap("n", "<leader>ml", "<C-w>h",{noremap = true, silent = true})-- Moverse a la ventana de la izquierda
vim.api.nvim_set_keymap("n", "<leader>mr", "<C-w>l",{noremap = true, silent = true})-- Moverse a la ventana de la derecha
vim.api.nvim_set_keymap("n", "<leader>mt", "<C-w>k",{noremap = true, silent = true})-- Moverse a la ventana superior
vim.api.nvim_set_keymap("n", "<leader>md", "<C-w>j",{noremap = true, silent = true})-- Moverse a la ventana inferior

-- Función para abrir un split vertical y lanzar Telescope para buscar archivos
function OpenVerticalSplitWithTelescope()
    vim.cmd("vsplit")-- Abrir un split vertical
    vim.cmd("Telescope find_files")-- Ejecutar Telescope para buscar archivos
end

-- Función para abrir un split horizontal y lanzar Telescope para buscar archivos
function OpenHorizontalSplitWithTelescope()
    vim.cmd("split")-- Abrir un split horizontal
    vim.cmd("Telescope find_files")-- Ejecutar Telescope para buscar archivos
end

-- Asignar las funciones a combinaciones de teclas personalizadas
vim.api.nvim_set_keymap(
"n",
"<leader>vs",
":lua OpenVerticalSplitWithTelescope()<CR>", -- Llama a la función para split vertical y Telescope
{noremap = true, silent = true}-- Configuración: sin mapeos recursivos y silencioso
)
vim.api.nvim_set_keymap(
"n",
"<leader>hs",
":lua OpenHorizontalSplitWithTelescope()<CR>", -- Llama a la función para split horizontal y Telescope
{noremap = true, silent = true}-- Configuración: sin mapeos recursivos y silencioso
)

-- Mover ventana hacia la derecha
vim.keymap.set("n", "<leader>pL", "<C-w>L",{desc = "Mover ventana hacia la derecha"})

-- Mover ventana hacia la izquierda
vim.keymap.set("n", "<leader>pR", "<C-w>H",{desc = "Mover ventana hacia la izquierda"})

-- Mover ventana hacia abajo
vim.keymap.set("n", "<leader>pD", "<C-w>J",{desc = "Mover ventana hacia abajo"})

-- Mover ventana hacia arriba
vim.keymap.set("n", "<leader>pT", "<C-w>K",{desc = "Mover ventana hacia arriba"})

-- Cerrar el buffer actual sin cerrar la ventana
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>",{noremap = true, silent = true})

-- Mapeo para traducir texto seleccionado en modo visual
vim.keymap.set('v', '<leader>t', ':Translate<CR>',{noremap = true, silent = true, desc = 'Traducir texto seleccionado'})

-- Asignación de teclas para traducir y reemplazar texto seleccionado
vim.keymap.set('v', '<leader>tw', ':TranslateW<CR>',{noremap = true, silent = true, desc = 'Traducir y reemplazar texto seleccionado'})

-- Mapeo para ejecutar ':TranslateR' en el rango visual
vim.keymap.set('v', '<leader>tr', ":'<,'>TranslateR<CR>",{noremap = true, silent = true, desc = 'Traducir y reemplazar texto seleccionado'})

-- Mapeo para ejecutar ':TranslateW' en el rango visual sin reemplazar el texto seleccionado
vim.keymap.set('v', '<leader>tw', ":'<,'>TranslateW<CR>",{noremap = true, silent = true, desc = 'Traducir texto seleccionado sin reemplazar'})

-- Para desactivar el resaltado después de terminar con una búsqueda
vim.api.nvim_set_keymap('n', '<leader>n', ':nohlsearch<CR>',{noremap = true, silent = true})

-- Comando personalizado para alternar el resaltado manualmente
vim.cmd([[
command! ToggleHlsearch set hlsearch!
]])

-- Crear un comando personalizado para :Q que cierre solo el buffer actual
vim.api.nvim_create_user_command('Q', function()
    -- Obtener buffers válidos y listados
    local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
    end, vim.api.nvim_list_bufs())

    if #buffers > 1 then
        -- Si hay más de un buffer, cerrar el buffer actual
        vim.cmd('bdelete')
    else
        -- Si no quedan buffers, intentar abrir Dashboard
        local ok, _ = pcall(vim.cmd, 'Dashboard')
        if not ok then
            -- Si Dashboard no está disponible, abrir un buffer vacío
            vim.cmd('enew')
        end
    end
end, { nargs = 0 })

-- Redefinir :q para llamar al comando :Q
vim.api.nvim_set_keymap('c', 'q', 'Q', { noremap = true, silent = true })
