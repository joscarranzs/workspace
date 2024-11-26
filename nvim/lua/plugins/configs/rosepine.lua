return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            variant = "moon",
            disable_italics = true,
            disable_background = true, -- Desactiva el fondo predeterminado
        })
        -- Elimina cualquier sobrescritura manual del fondo
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
        vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
        vim.cmd("colorscheme rose-pine")
    end,
}
