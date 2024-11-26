return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            enable = true, -- Habilita la transparencia automáticamente
            extra_groups = { -- Grupos adicionales para la transparencia
                "Normal",
                "NormalNC",
                "NormalFloat",
                "TelescopePrompt",
                "TelescopeResults",
                "TelescopePreview",
                "Pmenu",
                "PmenuSel",
                "StatusLine",
                "DiagnosticFloat",
                "FloatBorder",
            },
        })

        -- Asegúrate de activar manualmente la transparencia
        vim.cmd("TransparentEnable")
    end,
}
