-- File: ~/.config/nvim/lua/plugins/configs/goto-preview.lua

return {
    "rmagatti/goto-preview",
    config = function()
        require('goto-preview').setup {
            width = 120, -- Ancho de la ventana flotante
            height = 15, -- Alto de la ventana flotante
            border = {'↖', '─', '┐', '│', '┘', '─', '└', '│'}, -- Caracteres del borde
            default_mappings = false, -- Desactiva las asignaciones predeterminadas
            debug = false, -- Desactiva la información de depuración
            opacity = nil, -- Opacidad de la ventana (0-100), donde 100 es totalmente opaca
            resizing_mappings = false, -- Desactiva las teclas de flecha para redimensionar la ventana
            post_open_hook = nil, -- Función que se ejecuta después de abrir la ventana
            references = {
                telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
            },
            focus_on_open = true, -- Enfoca la ventana al abrirse
            dismiss_on_move = false, -- No cierra la ventana al mover el cursor
            force_close = true, -- Fuerza el cierre de la ventana
            bufhidden = "wipe", -- Elimina el buffer al cerrar la ventana
            stack_floating_preview_windows = true, -- Permite anidar ventanas flotantes
            preview_window_title = { enable = true, position = "left" }, -- Muestra el título de la ventana
            zindex = 1, -- Nivel de superposición de la ventana
        }

        -- Asignación de atajos de teclado con la tecla líder
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap('n', '<leader>pd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
        vim.api.nvim_set_keymap('n', '<leader>pt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
        vim.api.nvim_set_keymap('n', '<leader>pi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
        vim.api.nvim_set_keymap('n', '<leader>pr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
        vim.api.nvim_set_keymap('n', '<leader>pc', "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
    end
}
