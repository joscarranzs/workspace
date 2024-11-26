-- Archivo: lualine.lua
-- Configuración de lualine.nvim con separadores elegantes.

return {
    "nvim-lualine/lualine.nvim", -- Plugin para la barra de estado
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }, -- Opcional: soporte para íconos
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- Usa el tema actual
                component_separators = { left = "", right = "" }, -- Separadores entre componentes
                section_separators = { left = "", right = "" }, -- Separadores entre secciones
                disabled_filetypes = { -- Archivos donde no se mostrará lualine
                    statusline = {},
                    winbar = {},
                },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { "mode" }, -- Modo actual (normal, insert, etc.)
                lualine_b = { "branch", "diff", "diagnostics" }, -- Rama de Git, diferencias, diagnósticos
                lualine_c = { "filename" }, -- Nombre del archivo
                lualine_x = { "encoding", "fileformat", "filetype" }, -- Codificación y tipo de archivo
                lualine_y = { "progress" }, -- Progreso del archivo
                lualine_z = { "location" }, -- Posición del cursor
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {}, -- Configuración para la barra de pestañas (opcional)
            winbar = {}, -- Configuración para la barra de ventanas (opcional)
            extensions = {}, -- Extensiones opcionales (por ejemplo: nvim-tree, quickfix)
        })
    end,
}
