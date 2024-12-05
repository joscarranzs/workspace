return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    header = {
                        "██╗   ██╗███╗   ██╗ █████╗ ██╗██████╗ ███████╗ █████╗ ",
                        "██║   ██║████╗  ██║██╔══██╗██║██╔══██╗██╔════╝██╔══██╗",
                        "██║   ██║██╔██╗ ██║███████║██║██║  ██║█████╗  ███████║",
                        "██║   ██║██║╚██╗██║██╔══██║██║██║  ██║██╔══╝  ██╔══██║",
                        "╚██████╔╝██║ ╚████║██║  ██║██║██████╔╝███████╗██║  ██║",
                        " ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝",
                        "                                                      ",
                    },
                    shortcut = {
                        {
                            desc = "Find File",
                            group = "DashboardShortcut", -- Grupo de resaltado, puedes ajustarlo como prefieras
                            key = "f",
                            action = "Telescope find_files",
                        },
                        {
                            desc = "New File",
                            group = "DashboardShortcut",
                            key = "n",
                            action = "enew",
                        },
                        {
                            desc = "Recent Files",
                            group = "DashboardShortcut",
                            key = "r",
                            action = "Telescope oldfiles",
                        },
                        {
                            desc = "Find Text",
                            group = "DashboardShortcut",
                            key = "g",
                            action = "Telescope live_grep",
                        },
                        {
                            desc = "Config",
                            group = "DashboardShortcut",
                            key = "c",
                            action = "e ~/.config/nvim/init.lua",
                        },
                    },
                    packages = { enable = true },
                    project = {
                        enable = true,
                        limit = 8,
                        icon = "📂",
                        label = " Projects",
                        action = "Telescope find_files cwd=",
                    },
                    mru = {
                        enable = true,
                        limit = 10,
                        icon = "🕒",
                        label = " Recent",
                        cwd_only = false,
                    },
                    footer = { "Press key to execute command" }, -- Pie de página con una instrucción
                },
            })
        end,
    },
}
