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
            vim.g.db_ui_save_location = "~/mysql-workspace"

            -- Limpieza de buffers innecesarios
            vim.cmd([[
            autocmd FileType dbui,dbout,sql setlocal bufhidden=delete
            autocmd FileType dbui,dbout,sql setlocal modifiable
            ]])
        end,
        config = function()
            -- Función para cerrar buffers vacíos
            vim.cmd([[
            function! HandleEmptyBuffers()
            " Si el buffer está vacío, ciérralo automáticamente
            if line('$') == 1 && getline(1) == ''
            silent! execute "bdelete!"
            endif
            endfunction
            ]])

            -- Autocomando para manejar buffers después de escribir o abrir
            vim.cmd([[
            autocmd BufEnter * if &ft == 'dbout' | call HandleEmptyBuffers() | endif
            autocmd BufWritePost *.sql if &ft == 'dbout' | call HandleEmptyBuffers() | endif
            ]])
        end,
    },
}
