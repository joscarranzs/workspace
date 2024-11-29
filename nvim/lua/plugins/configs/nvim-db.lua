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
            vim.g.dbs = {
                test = "mysql://jcarranz@localhost/test",
            }
            vim.g.db_ui_save_location = "~/.config/nvim/db_ui_queries"

            -- Asegurar limpieza de buffers de DBUI y resultados
            vim.cmd([[
                autocmd FileType dbui,dbout,sql setlocal bufhidden=wipe
                ]])
        end,
        config = function()
            -- Este bloque elimina buffers vacíos "[No Name]" automáticamente
            vim.cmd([[
                autocmd BufEnter * if &ft == '' && bufname() == '' | bwipeout | endif
                ]])
        end,
    },
}
