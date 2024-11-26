-- ~/.config/nvim/lua/plugins/configs/dashboard.lua

return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "hyper", -- O "doom" según tu preferencia
                config = {
                    header = {
                        "███╗   ███╗██████╗          ██╗",
                        "████╗ ████║██╔══██╗         ██║",
                        "██╔████╔██║██████╔╝         ██║",
                        "██║╚██╔╝██║██╔══██╗    ██   ██║",
                        "██║ ╚═╝ ██║██║  ██║    ╚█████╔╝",
                        "╚═╝     ╚═╝╚═╝  ╚═╝     ╚════╝ ",
                        "                               ",
                    },
                    center = {
                        {
                            icon = "  ", -- Eliminar el ícono
                            desc = "Find File",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            icon = "  ", -- Eliminar el ícono
                            desc = "Find Text",
                            action = "Telescope live_grep",
                            key = "t",
                        },
                    },
                    footer = {}, -- Eliminar el pie de página
                },
            })
        end,
    },
}
