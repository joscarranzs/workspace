-- ~/.config/nvim/lua/core/keymaps.lua

-- Asignar la tecla líder (leader key)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Crear y registrar una función para eliminar caracteres molestos e indentar sin mover el cursor
vim.api.nvim_create_user_command("CleanAndFormat", function()
    -- Guardar la posición actual del cursor
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Eliminar caracteres no deseados como ^M (si existen)
    vim.cmd([[ %s/\r//ge ]])  -- Reemplaza ^M en todo el archivo (el modificador 'e' suprime errores si no se encuentra nada)

    -- Reindentar todo el archivo
    vim.cmd("normal gg=G")   -- Aplica reindentación global

    -- Restaurar la posición del cursor
    vim.api.nvim_win_set_cursor(0, cursor_pos)

    -- Guardar el archivo
    vim.cmd("write")
end, {})

-- Vincular la función al mapeo de teclas (líder + s)
vim.api.nvim_set_keymap("n", "<leader>s", ":CleanAndFormat<CR>", { noremap = true, silent = true })

-- Mapeos básicos (por si no estaban configurados antes)
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true }) -- Guardar
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true }) -- Salir
vim.api.nvim_set_keymap("n", "<leader>x", ":wq<CR>", { noremap = true, silent = true }) -- Guardar y salir
vim.api.nvim_set_keymap("n", "<leader>Q", ":qa!<CR>", { noremap = true, silent = true }) -- Salir sin guardar

-- Asignaciones de teclas para Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true, desc = "Buscar archivos" })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Buscar texto en archivos" })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "Listar buffers abiertos" })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Buscar en la ayuda" })

-- Mapear <Leader>o para insertar una nueva línea limpia debajo sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>o", "o<Esc>0D", { noremap = true, silent = true })

-- Mapear <Leader>O para insertar una nueva línea limpia arriba sin entrar en modo insert
vim.api.nvim_set_keymap("n", "<Leader>O", "O<Esc>0D", { noremap = true, silent = true })
