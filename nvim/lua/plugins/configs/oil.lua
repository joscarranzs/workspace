-- ~/.config/nvim/lua/plugins/configs/oil.lua

return {
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                -- Configuraciones adicionales pueden ir aquí
            })

            -- Asignar la tecla '-' para abrir oil.nvim
            vim.keymap.set("n", "-", require("oil").open, { desc = "Abrir Oil File Explorer" })
        end,
    },
}
