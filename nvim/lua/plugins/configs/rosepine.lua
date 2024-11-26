return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "moon",
            disable_italics = true,
        })
        -- Establecer un fondo específico para rose-pine si es necesario
        vim.cmd("highlight Normal guibg=#1e1e2e")
        vim.cmd("colorscheme rose-pine")
    end,
}
