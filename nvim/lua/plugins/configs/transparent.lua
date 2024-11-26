return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            enable = true, -- Habilita la transparencia automáticamente
            extra_groups = {
                "Normal",
                "NormalFloat",
                "TelescopePrompt",
                "TelescopeResults",
                "Pmenu",
                "PmenuSel",
                "StatusLine",
                "DiagnosticFloat",
            },
        })

        -- Asegúrate de activar manualmente la transparencia
        vim.cmd("TransparentEnable")
    end,
}
