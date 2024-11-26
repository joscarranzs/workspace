-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    {
        "nvim-telescope/telescope.nvim", -- Plugin principal
        dependencies = {
            "nvim-lua/plenary.nvim", -- Dependencia requerida
            "nvim-tree/nvim-web-devicons", -- Opcional: para íconos en los resultados
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Opcional: mejora el rendimiento de búsqueda
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    prompt_prefix = "🔍 ", -- Prefijo del prompt de búsqueda
                    selection_caret = "➤ ", -- Indicador de selección
                    path_display = { "smart" }, -- Muestra rutas de archivos de manera inteligente
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.move_selection_next, -- Mover selección hacia abajo
                            ["<C-p>"] = actions.move_selection_previous, -- Mover selección hacia arriba
                            ["<C-c>"] = actions.close, -- Cerrar Telescope
                            ["<CR>"] = actions.select_default, -- Seleccionar elemento
                            ["<C-x>"] = actions.select_horizontal, -- Abrir en split horizontal
                            ["<C-v>"] = actions.select_vertical, -- Abrir en split vertical
                            ["<C-t>"] = actions.select_tab, -- Abrir en nueva pestaña
                        },
                        n = {
                            ["q"] = actions.close, -- Cerrar Telescope en modo normal
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true, -- Incluir archivos ocultos en la búsqueda
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden" } -- Incluir archivos ocultos en la búsqueda de texto
                        end,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- Habilitar búsqueda difusa
                        override_generic_sorter = true, -- Sobrescribir el sorter genérico
                        override_file_sorter = true, -- Sobrescribir el sorter de archivos
                        case_mode = "smart_case", -- Modo de sensibilidad a mayúsculas
                    },
                },
            })

            -- Cargar la extensión fzf si está instalada
            pcall(telescope.load_extension, "fzf")
        end,
    },
}
