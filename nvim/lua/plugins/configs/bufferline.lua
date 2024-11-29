return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                numbers = "none", -- Opcional: muestra el número de buffer
                diagnostics = "nvim_lsp", -- Integra diagnósticos de LSP
                show_buffer_icons = true, -- Muestra íconos de los buffers
                show_close_icon = false, -- Oculta el icono de cerrar global
                show_buffer_close_icons = false, -- Oculta los iconos de cerrar de cada buffer
                separator_style = "none", -- Elimina los separadores (puedes cambiarlo)
                always_show_bufferline = true, -- Siempre muestra la barra
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
            },
            highlights = {
                -- Fondo de toda la barra
                fill = {
                    guibg = "NONE", -- Fondo completamente transparente
                    ctermbg = "NONE",
                },
                -- Fondo de buffers inactivos
                background = {
                    guibg = "NONE", -- Fondo transparente
                    ctermbg = "NONE",
                },
                -- Fondo del buffer seleccionado
                buffer_selected = {
                    guibg = "NONE", -- Fondo transparente para el buffer activo
                    ctermbg = "NONE",
                    gui = "bold", -- Opcional: destaca con negrita
                },
                -- Separadores
                separator = {
                    guibg = "NONE",
                    guifg = "NONE",
                },
                separator_selected = {
                    guibg = "NONE",
                    guifg = "NONE",
                },
                separator_visible = {
                    guibg = "NONE",
                    guifg = "NONE",
                },
                -- Indicador de modificado
                modified = {
                    guibg = "NONE",
                    guifg = "yellow", -- Opcional: color para el icono de modificado
                },
                modified_selected = {
                    guibg = "NONE",
                    guifg = "yellow",
                },
                modified_visible = {
                    guibg = "NONE",
                    guifg = "yellow",
                },
                -- Fondo de pestañas (si usas pestañas)
                tab = {
                    guibg = "NONE",
                    ctermbg = "NONE",
                },
                tab_selected = {
                    guibg = "NONE",
                    ctermbg = "NONE",
                },
                tab_close = {
                    guibg = "NONE",
                    ctermbg = "NONE",
                },
            },
        })

        -- Forzar transparencia para evitar temas externos que modifiquen el fondo
        vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE", fg = "NONE" })
    end,
}
