-- File: nvim/plugins/configs/bufferline.lua
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
                show_close_icon = false, -- Oculta el icono de cerrar global (más limpio)
                show_buffer_close_icons = false, -- Oculta los iconos de cerrar de cada buffer
                separator_style = "none", -- Elimina los separadores (puedes cambiar a "slant" o "padded_slant")
                always_show_bufferline = true, -- Siempre muestra la barra, incluso con un solo buffer
                offsets = {
                    {
                        filetype = "NvimTree", -- Integra con NvimTree si lo usas
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
            },
            highlights = {
                fill = {
                    guibg = "NONE", -- Hace transparente el fondo de la barra
                },
                background = {
                    guibg = "NONE", -- Hace transparente el fondo de los buffers inactivos
                },
            },
        })
    end,
}
