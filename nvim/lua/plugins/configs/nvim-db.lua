return {
    "tpope/vim-dadbod", -- Modern database interface for Vim
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1

            -- Configuración de la base de datos MySQL en vim-dadbod
            vim.g.dbs = {
                test = "mysql://jcarranz@localhost/test", -- Única base de datos configurada
            }
        end,
    },
}
