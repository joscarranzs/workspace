-- File: ~/.config/nvim/lua/plugins/configs/harpoon.lua

return {
    -- Declarar el plugin
    'ThePrimeagen/harpoon',

    -- Configuraciones del plugin
    config = function()
        local harpoon = require("harpoon")
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Configuración inicial
        harpoon.setup({
            global_settings = {
                save_on_toggle = true,    -- Guarda automáticamente al abrir/cerrar el menú
                save_on_change = true,    -- Guarda automáticamente los cambios
                enter_on_sendcmd = false, -- No mover el cursor al terminal tras enviar un comando
                tmux_autoclose_windows = false, -- No cerrar ventanas tmux automáticamente
                excluded_filetypes = { "harpoon" }, -- Ignorar archivos específicos
            },
        })

        -- Mapeos de teclas
        vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true }) -- Marcar archivo actual
        vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true }) -- Mostrar menú
        vim.api.nvim_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true }) -- Navegar al archivo 1
        vim.api.nvim_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true }) -- Navegar al archivo 2
        vim.api.nvim_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true }) -- Navegar al archivo 3
        vim.api.nvim_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true }) -- Navegar al archivo 4
        vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', { noremap = true, silent = true }) -- Mostrar menú de comandos
    end
}
