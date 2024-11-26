-- statusline configuration
return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        -- Cargar colores de Rose Pine
        local rosepine_colors = require("rose-pine.palette")
        if not rosepine_colors then
            return
        end

        -- Tema bubbles basado en Rose Pine
        local bubbles_theme = {
            normal = {
                a = { fg = rosepine_colors.base, bg = "#EBBCBA" }, -- Cambiado a #EBBCBA
                b = { fg = rosepine_colors.text, bg = rosepine_colors.overlay },
                c = { fg = rosepine_colors.text, bg = rosepine_colors.surface },
            },
            insert = { a = { fg = rosepine_colors.base, bg = rosepine_colors.iris } },
            visual = { a = { fg = rosepine_colors.base, bg = rosepine_colors.pine } },
            replace = { a = { fg = rosepine_colors.base, bg = rosepine_colors.love } },
            inactive = {
                a = { fg = rosepine_colors.text, bg = rosepine_colors.surface },
                b = { fg = rosepine_colors.text, bg = rosepine_colors.surface },
                c = { fg = rosepine_colors.text, bg = rosepine_colors.base },
            },
        }

        -- Configuración de lualine
        opts.options = opts.options or {}
        opts.options.theme = bubbles_theme
        opts.options.section_separators = { left = "", right = "" }
        opts.options.component_separators = ""
    end,
}
