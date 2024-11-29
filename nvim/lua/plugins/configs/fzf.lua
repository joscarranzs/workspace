-- Archivo: fzf_config.lua
-- Configuración completa para usar fzf.vim con búsqueda de archivos, líneas y texto en el proyecto.

return {
    {
        "junegunn/fzf", -- Plugin base
        build = "./install --all", -- Construye fzf al instalar
    },
    {
        "junegunn/fzf.vim", -- Integra fzf en Neovim
        dependencies = { "junegunn/fzf" },
        config = function()
            -- Atajos de teclado personalizados para fzf
            local opts = { noremap = true, silent = true }

            -- Buscar archivos en el directorio actual
            vim.api.nvim_set_keymap("n", "<Leader>ff", ":Files<CR>", opts)

            -- Buscar archivos del repositorio Git
            vim.api.nvim_set_keymap("n", "<Leader>fg", ":GFiles<CR>", opts)

            -- Buscar líneas en los buffers abiertos
            vim.api.nvim_set_keymap("n", "<Leader>fl", ":Lines<CR>", opts)

            -- Buscar texto en el proyecto (necesita ripgrep instalado)
            vim.api.nvim_set_keymap("n", "<Leader>fp", ":Rg<CR>", opts)

            -- Buscar etiquetas en el archivo actual (ctags necesario)
            vim.api.nvim_set_keymap("n", "<Leader>ft", ":BTags<CR>", opts)

            -- Buscar etiquetas en todo el proyecto (ctags necesario)
            vim.api.nvim_set_keymap("n", "<Leader>fT", ":Tags<CR>", opts)

            -- Configuración adicional (opcional)
            vim.g.fzf_layout = { down = "40%" } -- Muestra la ventana de fzf ocupando el 40% de la pantalla
            vim.g.fzf_preview_window = { "right:50%", "ctrl-/" } -- Vista previa en el lado derecho
        end,
    },
}
