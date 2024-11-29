-- Archivo de configuración para rose-pine con mejoras

return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        -- Configuración inicial del tema
        require("rose-pine").setup({
            variant = "main",
            disable_italics = true,
            disable_background = true, -- Desactiva el fondo predeterminado
            highlight_groups = {
                Comment = { fg = "#6e6a86", italic = false },
                CursorLine = { bg = "#2a273f" },
                LineNr = { fg = "#6e6a86" },
                CursorLineNr = { fg = "#f6c177", bold = true },
            },
        })

        -- Elimina cualquier sobrescritura manual del fondo
        vim.opt.background = "dark"
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
        vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")

        -- Personalización adicional para soporte LSP
        vim.cmd([[
            highlight DiagnosticError guifg=#eb6f92 gui=bold
            highlight DiagnosticWarn guifg=#f6c177 gui=bold
            highlight DiagnosticInfo guifg=#9ccfd8 gui=bold
            highlight DiagnosticHint guifg=#c4a7e7 gui=bold
            ]])

        -- Configuración de integración con Telescope
        vim.cmd([[
            highlight TelescopeBorder guifg=#6e6a86
            highlight TelescopePromptBorder guifg=#6e6a86
            highlight TelescopeMatching guifg=#f6c177
            highlight TelescopeSelection guibg=#2a273f
            ]])

        -- Configuración de integración con NvimTree
        vim.cmd([[
            highlight NvimTreeFolderIcon guifg=#f6c177
            highlight NvimTreeFolderName guifg=#9ccfd8
            ]])

        -- Activar el esquema de colores
        vim.cmd("colorscheme rose-pine")

        -- Configuración de integración con Lualine
        require('lualine').setup({
            options = {
                theme = 'rose-pine',
            },
        })

        -- Función para alternar variantes del tema
        local current_variant = "moon"
        function ToggleRosePineVariant()
            current_variant = current_variant == "moon" and "main" or "moon"
            require("rose-pine").setup({ variant = current_variant })
            vim.cmd("colorscheme rose-pine")
            print("Tema cambiado a: " .. current_variant)
        end

        -- Mapeo para alternar variantes del tema
        vim.api.nvim_set_keymap("n", "<leader>tm", ":lua ToggleRosePineVariant()<CR>", { noremap = true, silent = true })
    end,
}
