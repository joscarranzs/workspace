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
            -- Configuración inicial
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.dbs = {
                test = "mysql://jcarranz@localhost/test",
            }
            vim.g.db_ui_save_location = "~/mysql-workspace"

            -- Limpieza de buffers de DBUI y SQL
            vim.cmd([[
            autocmd FileType dbui,dbout,sql setlocal bufhidden=delete
            autocmd FileType dbui,dbout,sql setlocal modifiable
            autocmd FileType sql setlocal commentstring=--\ %s
            ]])
        end,
        config = function()
            -- Auto-eliminación de buffers vacíos
            vim.cmd([[
            autocmd BufEnter * if &ft == '' && bufname() == '' && winnr('$') > 1 | bwipeout | endif
            ]])

            -- Configuración de completado para Dadbod
            vim.cmd([[
            autocmd FileType sql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
            ]])
        end,
    },
}
