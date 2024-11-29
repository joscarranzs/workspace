return {
    "tpope/vim-dadbod",
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
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_save_location = "~/mysql-workspace"
            vim.g.dbs = {
                test = "mysql://jcarranz@localhost/test",
            }

            -- Agregar los iconos personalizados
            vim.g.db_ui_icons = {
                expanded = '▾',
                collapsed = '▸',
                saved_query = '*',
                new_query = '+',
                tables = '~',
                buffers = '»',
                connection_ok = '✓',
                connection_error = '✕',
            }

            -- Configuración de comentarios para archivos SQL y similares
            vim.cmd([[
            autocmd FileType dbui,dbout,sql setlocal commentstring=--\ %s
            ]])
        end,
    },
}
