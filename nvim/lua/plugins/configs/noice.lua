-- ~/.config/nvim/lua/plugins/configs/noice.lua
-- Configuración del plugin noice.nvim

return {
    {
        "folke/noice.nvim", -- Plugin principal
        event = "VeryLazy", -- Carga cuando es necesario, optimizando el inicio
        dependencies = {
            "MunifTanjim/nui.nvim", -- Dependencia para crear ventanas emergentes
            "rcarriga/nvim-notify", -- Notificaciones avanzadas
        },
        config = function()
            -- Configuración del plugin nvim-notify
            require("notify").setup({
                timeout = 500, -- Tiempo de espera para mostrar la notificación
            })

            -- Configuración principal de noice.nvim
            require("noice").setup({
                -- Configuración de la línea de comandos
                cmdline = {
                    enabled = true, -- Activa la interfaz de línea de comandos mejorada
                    view = "cmdline_popup", -- Usa una ventana emergente
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" }, -- Prefijo para ":" (comandos)
                        search_down = { pattern = "^/", icon = " ", lang = "regex" }, -- Prefijo para búsqueda "/"
                        search_up = { pattern = "^%?", icon = " ", lang = "regex" }, -- Prefijo para búsqueda inversa "?"
                        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" }, -- Prefijo para comandos Lua
                        help = { pattern = "^:%s*he?l?p?%s+", icon = "", lang = "help" }, -- Prefijo para ayuda
                    },
                },
                -- Configuración de mensajes
                messages = {
                    enabled = true, -- Activa los mensajes estilizados
                },
                -- Configuración del menú emergente
                popupmenu = {
                    enabled = true, -- Activa el menú emergente mejorado
                    backend = "nui", -- Utiliza nui.nvim para la interfaz
                },
                -- Configuración de notificaciones
                notify = {
                    enabled = true, -- Usa notificaciones avanzadas
                    view = "notify", -- Muestra notificaciones con nvim-notify
                },
                -- Configuración para LSP
                lsp = {
                    progress = {
                        enabled = true, -- Muestra el progreso de LSP
                        format = "lsp_progress", -- Formato de progreso
                        format_done = "lsp_progress_done", -- Formato para progreso completado
                        view = "mini", -- Usa una ventana pequeña para mostrar progreso
                    },
                    hover = {
                        enabled = true, -- Habilita "hover" (al pasar el cursor)
                    },
                    signature = {
                        enabled = true, -- Habilita sugerencias de firmas de funciones
                        auto_open = {
                            enabled = true, -- Abre automáticamente las sugerencias
                        },
                    },
                    documentation = {
                        view = "hover", -- Muestra documentación en una ventana de hover
                    },
                },
                -- Configuración de Markdown
                markdown = {
                    hover = {
                        ["|(%S-)|"] = vim.cmd.help, -- Enlaza palabras a la ayuda
                        ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- Abre enlaces Markdown
                    },
                },
                -- Configuración de salud
                health = {
                    checker = true, -- Activa el verificador de salud del plugin
                },
                -- Movimientos inteligentes
                smart_move = {
                    enabled = true, -- Activa movimientos inteligentes
                },
                -- Configuración de presets
                presets = {
                    bottom_search = true, -- La búsqueda aparece en la parte inferior
                    command_palette = true, -- Activa una paleta de comandos estilizada
                    long_message_to_split = true, -- Divide mensajes largos en paneles
                },
            })
        end,
    },
}
